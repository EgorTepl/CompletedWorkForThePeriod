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
    public class StageUnitTest : SqlDatabaseTestClass
    {

        public StageUnitTest()
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
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTest_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(StageUnitTest));
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition inconclusiveCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition inconclusiveCondition2;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition inconclusiveCondition3;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition inconclusiveCondition4;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_stageJobTicketByTestType_SyncTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition inconclusiveCondition5;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_stageJobTicket_SyncTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition inconclusiveCondition6;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.EmptyResultSetCondition emptyResultSetCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PosttestAction;
            this.Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Pbi_11709_Sp_stageJobTicketByTestType_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Pbi_11709_Sp_stageJobTicket_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            inconclusiveCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition();
            Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            inconclusiveCondition2 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition();
            Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            inconclusiveCondition3 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition();
            Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            inconclusiveCondition4 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition();
            Pbi_11709_Sp_stageJobTicketByTestType_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            inconclusiveCondition5 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition();
            Pbi_11709_Sp_stageJobTicket_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            inconclusiveCondition6 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.InconclusiveCondition();
            Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            emptyResultSetCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.EmptyResultSetCondition();
            Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PosttestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            // 
            // Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTest_TestAction
            // 
            Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTest_TestAction.Conditions.Add(inconclusiveCondition1);
            resources.ApplyResources(Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTest_TestAction, "Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTest_TestAction");
            // 
            // inconclusiveCondition1
            // 
            inconclusiveCondition1.Enabled = true;
            inconclusiveCondition1.Name = "inconclusiveCondition1";
            // 
            // Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTest_TestAction
            // 
            Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTest_TestAction.Conditions.Add(inconclusiveCondition2);
            resources.ApplyResources(Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTest_TestAction, "Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTest_TestAction");
            // 
            // inconclusiveCondition2
            // 
            inconclusiveCondition2.Enabled = true;
            inconclusiveCondition2.Name = "inconclusiveCondition2";
            // 
            // Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTest_TestAction
            // 
            Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTest_TestAction.Conditions.Add(inconclusiveCondition3);
            resources.ApplyResources(Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTest_TestAction, "Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTest_TestAction");
            // 
            // inconclusiveCondition3
            // 
            inconclusiveCondition3.Enabled = true;
            inconclusiveCondition3.Name = "inconclusiveCondition3";
            // 
            // Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTest_TestAction
            // 
            Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTest_TestAction.Conditions.Add(inconclusiveCondition4);
            resources.ApplyResources(Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTest_TestAction, "Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTest_TestAction");
            // 
            // inconclusiveCondition4
            // 
            inconclusiveCondition4.Enabled = true;
            inconclusiveCondition4.Name = "inconclusiveCondition4";
            // 
            // Pbi_11709_Sp_stageJobTicketByTestType_SyncTest_TestAction
            // 
            Pbi_11709_Sp_stageJobTicketByTestType_SyncTest_TestAction.Conditions.Add(inconclusiveCondition5);
            resources.ApplyResources(Pbi_11709_Sp_stageJobTicketByTestType_SyncTest_TestAction, "Pbi_11709_Sp_stageJobTicketByTestType_SyncTest_TestAction");
            // 
            // inconclusiveCondition5
            // 
            inconclusiveCondition5.Enabled = true;
            inconclusiveCondition5.Name = "inconclusiveCondition5";
            // 
            // Pbi_11709_Sp_stageJobTicket_SyncTest_TestAction
            // 
            Pbi_11709_Sp_stageJobTicket_SyncTest_TestAction.Conditions.Add(inconclusiveCondition6);
            resources.ApplyResources(Pbi_11709_Sp_stageJobTicket_SyncTest_TestAction, "Pbi_11709_Sp_stageJobTicket_SyncTest_TestAction");
            // 
            // inconclusiveCondition6
            // 
            inconclusiveCondition6.Enabled = true;
            inconclusiveCondition6.Name = "inconclusiveCondition6";
            // 
            // Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_TestAction
            // 
            Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_TestAction.Conditions.Add(emptyResultSetCondition1);
            resources.ApplyResources(Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_TestAction, "Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_TestAction");
            // 
            // Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTestData
            // 
            this.Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTestData.PosttestAction = null;
            this.Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTestData.PretestAction = null;
            this.Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTestData.TestAction = Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTestData
            // 
            this.Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTestData.PosttestAction = null;
            this.Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTestData.PretestAction = null;
            this.Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTestData.TestAction = Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTestData
            // 
            this.Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTestData.PosttestAction = null;
            this.Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTestData.PretestAction = null;
            this.Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTestData.TestAction = Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTestData
            // 
            this.Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTestData.PosttestAction = null;
            this.Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTestData.PretestAction = null;
            this.Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTestData.TestAction = Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_stageJobTicketByTestType_SyncTestData
            // 
            this.Pbi_11709_Sp_stageJobTicketByTestType_SyncTestData.PosttestAction = null;
            this.Pbi_11709_Sp_stageJobTicketByTestType_SyncTestData.PretestAction = null;
            this.Pbi_11709_Sp_stageJobTicketByTestType_SyncTestData.TestAction = Pbi_11709_Sp_stageJobTicketByTestType_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_stageJobTicket_SyncTestData
            // 
            this.Pbi_11709_Sp_stageJobTicket_SyncTestData.PosttestAction = null;
            this.Pbi_11709_Sp_stageJobTicket_SyncTestData.PretestAction = null;
            this.Pbi_11709_Sp_stageJobTicket_SyncTestData.TestAction = Pbi_11709_Sp_stageJobTicket_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTestData
            // 
            this.Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTestData.PosttestAction = Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PosttestAction;
            this.Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTestData.PretestAction = Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PretestAction;
            this.Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTestData.TestAction = Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_TestAction;
            // 
            // Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PretestAction
            // 
            resources.ApplyResources(Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PretestAction, "Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PretestAction");
            // 
            // emptyResultSetCondition1
            // 
            emptyResultSetCondition1.Enabled = true;
            emptyResultSetCondition1.Name = "emptyResultSetCondition1";
            emptyResultSetCondition1.ResultSet = 1;
            // 
            // Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PosttestAction
            // 
            resources.ApplyResources(Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PosttestAction, "Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest_PosttestAction");
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
        public void Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTestData;
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
        public void Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTestData;
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
        public void Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTestData;
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
        public void Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTestData;
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
        public void Pbi_11709_Sp_stageJobTicketByTestType_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_stageJobTicketByTestType_SyncTestData;
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
        public void Pbi_11709_Sp_stageJobTicket_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_stageJobTicket_SyncTestData;
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
        public void Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTest()
        {
            SqlDatabaseTestActions testActions = this.Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTestData;
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
        private SqlDatabaseTestActions Pbi_11709_Sp_stageInventoryJournalByMovementType_SyncTestData;
        private SqlDatabaseTestActions Pbi_11709_Sp_stageInventoryJournalBySpecificationType_SyncTestData;
        private SqlDatabaseTestActions Pbi_11709_Sp_stageInventoryJournalByTransferType_SyncTestData;
        private SqlDatabaseTestActions Pbi_11709_Sp_stageJobTicketByRepairControlType_SyncTestData;
        private SqlDatabaseTestActions Pbi_11709_Sp_stageJobTicketByTestType_SyncTestData;
        private SqlDatabaseTestActions Pbi_11709_Sp_stageJobTicket_SyncTestData;
        private SqlDatabaseTestActions Pbi_11709_Sp_stageReceiptOfInventoryItem_SyncTestData;
    }
}
