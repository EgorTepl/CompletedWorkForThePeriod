using Microsoft.Data.Tools.Schema.Sql.UnitTesting;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;

namespace CompletedWorkForThePeriodUnitTest
{
    [TestClass()]
    public class FctUnitTest : SqlDatabaseTestClass
    {

        public FctUnitTest()
        {
            InitializeComponent();
        }

        [TestInitialize()]
        public void TestInitialize()
        {
            base.InitializeTest();
        }
        [TestCleanup()]
        public void TestCleanup()
        {
            base.CleanupTest();
        }

        #region Designer support code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTest_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FctUnitTest));
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition inconclusiveCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctInventoryJournal_SyncTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctJobTicket_SyncTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition rowCountCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.EmptyResultSetCondition emptyResultSetCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PosttestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctJobTicket_SyncTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctJobTicket_SyncTest_PosttestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctInventoryJournal_SyncTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_fctInventoryJournal_SyncTest_PosttestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition rowCountCondition2;
            this.Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Pbi_11709_Sp_fctInventoryJournal_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Pbi_11709_Sp_fctJobTicket_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            inconclusiveCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition();
            Pbi_11709_Sp_fctInventoryJournal_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Pbi_11709_Sp_fctJobTicket_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            rowCountCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition();
            Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            emptyResultSetCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.EmptyResultSetCondition();
            Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PosttestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Pbi_11709_Sp_fctJobTicket_SyncTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Pbi_11709_Sp_fctJobTicket_SyncTest_PosttestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Pbi_11709_Sp_fctInventoryJournal_SyncTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Pbi_11709_Sp_fctInventoryJournal_SyncTest_PosttestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            rowCountCondition2 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition();
            // 
            // Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTest_TestAction
            // 
            Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTest_TestAction.Conditions.Add(inconclusiveCondition1);
            resources.ApplyResources(Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTest_TestAction, "Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTest_TestAction");
            // 
            // inconclusiveCondition1
            // 
            inconclusiveCondition1.Enabled = true;
            inconclusiveCondition1.Name = "inconclusiveCondition1";
            // 
            // Pbi_11709_Sp_fctInventoryJournal_SyncTest_TestAction
            // 
            Pbi_11709_Sp_fctInventoryJournal_SyncTest_TestAction.Conditions.Add(rowCountCondition2);
            resources.ApplyResources(Pbi_11709_Sp_fctInventoryJournal_SyncTest_TestAction, "Pbi_11709_Sp_fctInventoryJournal_SyncTest_TestAction");
            // 
            // Pbi_11709_Sp_fctJobTicket_SyncTest_TestAction
            // 
            Pbi_11709_Sp_fctJobTicket_SyncTest_TestAction.Conditions.Add(rowCountCondition1);
            resources.ApplyResources(Pbi_11709_Sp_fctJobTicket_SyncTest_TestAction, "Pbi_11709_Sp_fctJobTicket_SyncTest_TestAction");
            // 
            // rowCountCondition1
            // 
            rowCountCondition1.Enabled = true;
            rowCountCondition1.Name = "rowCountCondition1";
            rowCountCondition1.ResultSet = 1;
            rowCountCondition1.RowCount = 2;
            // 
            // Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_TestAction
            // 
            Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_TestAction.Conditions.Add(emptyResultSetCondition1);
            resources.ApplyResources(Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_TestAction, "Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_TestAction");
            // 
            // emptyResultSetCondition1
            // 
            emptyResultSetCondition1.Enabled = true;
            emptyResultSetCondition1.Name = "emptyResultSetCondition1";
            emptyResultSetCondition1.ResultSet = 1;
            // 
            // Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PretestAction
            // 
            resources.ApplyResources(Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PretestAction, "Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PretestAction");
            // 
            // Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PosttestAction
            // 
            resources.ApplyResources(Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PosttestAction, "Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PosttestAction");
            // 
            // Pbi_11709_Sp_fctJobTicket_SyncTest_PretestAction
            // 
            resources.ApplyResources(Pbi_11709_Sp_fctJobTicket_SyncTest_PretestAction, "Pbi_11709_Sp_fctJobTicket_SyncTest_PretestAction");
            // 
            // Pbi_11709_Sp_fctJobTicket_SyncTest_PosttestAction
            // 
            resources.ApplyResources(Pbi_11709_Sp_fctJobTicket_SyncTest_PosttestAction, "Pbi_11709_Sp_fctJobTicket_SyncTest_PosttestAction");
            // 
            // Pbi_11709_Sp_fctInventoryJournal_SyncTest_PretestAction
            // 
            resources.ApplyResources(Pbi_11709_Sp_fctInventoryJournal_SyncTest_PretestAction, "Pbi_11709_Sp_fctInventoryJournal_SyncTest_PretestAction");
            // 
            // Pbi_11709_Sp_fctInventoryJournal_SyncTest_PosttestAction
            // 
            resources.ApplyResources(Pbi_11709_Sp_fctInventoryJournal_SyncTest_PosttestAction, "Pbi_11709_Sp_fctInventoryJournal_SyncTest_PosttestAction");
            // 
            // Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTestData
            // 
            this.Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTestData.PosttestAction = null;
            this.Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTestData.PretestAction = null;
            this.Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTestData.TestAction = Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_fctInventoryJournal_SyncTestData
            // 
            this.Pbi_11709_Sp_fctInventoryJournal_SyncTestData.PosttestAction = Pbi_11709_Sp_fctInventoryJournal_SyncTest_PosttestAction;
            this.Pbi_11709_Sp_fctInventoryJournal_SyncTestData.PretestAction = Pbi_11709_Sp_fctInventoryJournal_SyncTest_PretestAction;
            this.Pbi_11709_Sp_fctInventoryJournal_SyncTestData.TestAction = Pbi_11709_Sp_fctInventoryJournal_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_fctJobTicket_SyncTestData
            // 
            this.Pbi_11709_Sp_fctJobTicket_SyncTestData.PosttestAction = Pbi_11709_Sp_fctJobTicket_SyncTest_PosttestAction;
            this.Pbi_11709_Sp_fctJobTicket_SyncTestData.PretestAction = Pbi_11709_Sp_fctJobTicket_SyncTest_PretestAction;
            this.Pbi_11709_Sp_fctJobTicket_SyncTestData.TestAction = Pbi_11709_Sp_fctJobTicket_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTestData
            // 
            this.Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTestData.PosttestAction = Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PosttestAction;
            this.Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTestData.PretestAction = Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_PretestAction;
            this.Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTestData.TestAction = Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest_TestAction;
            // 
            // rowCountCondition2
            // 
            rowCountCondition2.Enabled = true;
            rowCountCondition2.Name = "rowCountCondition2";
            rowCountCondition2.ResultSet = 1;
            rowCountCondition2.RowCount = 7;
        }

        #endregion


        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        #endregion

        [TestMethod()]
        public void Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void Pbi_11709_Sp_fctInventoryJournal_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_fctInventoryJournal_SyncTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void Pbi_11709_Sp_fctJobTicket_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_fctJobTicket_SyncTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        private SqlDatabaseTestActions Pbi_11709_Sp_fctCompletedWorkForThePeriod_SyncTestData;
        private SqlDatabaseTestActions Pbi_11709_Sp_fctInventoryJournal_SyncTestData;
        private SqlDatabaseTestActions Pbi_11709_Sp_fctJobTicket_SyncTestData;
        private SqlDatabaseTestActions Pbi_11709_Sp_fctReceiptOfInventoryItem_SyncTestData;
    }
}
