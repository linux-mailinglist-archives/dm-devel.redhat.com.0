Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 419CA61307C
	for <lists+dm-devel@lfdr.de>; Mon, 31 Oct 2022 07:39:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667198350;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CxBX9JTbzDB5wFuC7c9Wn28M0HNTczTOLu4mADdGFg8=;
	b=cfc5eqIX3HL0yRNLTlSpJUEdGGzfQbUA/KZW/MKT+eMoGgx3AK8djTYnDYXvH01SUlw7bV
	g9YS+PyFQjAXjhRqxInlkstyzjuCJpQpMPSVI3IGo72gOZJ3LVoC30194gdBFBicNXPH6W
	TRMnvHL2RYZ6xCq3QHFZztPZo9D912E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-VuOV0pM5NxKYIXKQLtgvQg-1; Mon, 31 Oct 2022 02:38:56 -0400
X-MC-Unique: VuOV0pM5NxKYIXKQLtgvQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C694832E6D;
	Mon, 31 Oct 2022 06:38:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA6BB2166B29;
	Mon, 31 Oct 2022 06:38:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B0641946A77;
	Mon, 31 Oct 2022 06:38:50 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 975B91946597
 for <dm-devel@listman.corp.redhat.com>; Wed, 26 Oct 2022 23:22:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CF3E40C83EE; Wed, 26 Oct 2022 23:22:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 749F040C83EB
 for <dm-devel@redhat.com>; Wed, 26 Oct 2022 23:22:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46C783C0ED43
 for <dm-devel@redhat.com>; Wed, 26 Oct 2022 23:22:16 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-ubn8CdSzPwC0KeATrb5blA-1; Wed, 26 Oct 2022 19:22:14 -0400
X-MC-Unique: ubn8CdSzPwC0KeATrb5blA-1
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29QM6l4Z014666;
 Wed, 26 Oct 2022 23:20:03 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfays0jf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 23:20:02 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29QMAWis006963; Wed, 26 Oct 2022 23:20:01 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfaggdrhk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 23:20:01 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 DS7PR10MB5117.namprd10.prod.outlook.com (2603:10b6:5:3a6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Wed, 26 Oct 2022 23:20:00 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::19f7:e081:85b4:c5df]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::19f7:e081:85b4:c5df%7]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 23:20:00 +0000
From: Mike Christie <michael.christie@oracle.com>
To: bvanassche@acm.org, hch@lst.de, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, james.bottomley@hansenpartnership.com,
 linux-block@vger.kernel.org, dm-devel@redhat.com, snitzer@kernel.org,
 axboe@kernel.dk, linux-nvme@lists.infradead.org, chaitanyak@nvidia.com,
 kbusch@kernel.org, target-devel@vger.kernel.org
Date: Wed, 26 Oct 2022 18:19:34 -0500
Message-Id: <20221026231945.6609-9-michael.christie@oracle.com>
In-Reply-To: <20221026231945.6609-1-michael.christie@oracle.com>
References: <20221026231945.6609-1-michael.christie@oracle.com>
X-ClientProxiedBy: CH2PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:610:4c::21) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_|DS7PR10MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f21984f-71d8-41a3-d4be-08dab7a89a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: vWSnxZiXARMpZF/xX99BcveV4P+u8W1rMfZb7BJB8M7I7x2Q4NC6Gakq7TNw+DgMaCUIJfyLLTMYIIdJRGshQ8bsjeiTuHbezVxneHU9aBFN+gxR0kMjBUiBbi++nXfZwo6B0lLCzlc8lO72dq1GWSv8YFZgk9lxlDz91PxMB/74TtWfCMMxydTnzKLcy5xnC8TlRz/a1Cygo0/ZJGkwTPJn9oNO+TJMvT5NWbNq98R9kE3W1EnWr915h8olTs/kmuESesRhtnS3/mORX1wR3KckNQRRNB7gYCRCdodXCP+v3uCmj1B639ilOi6Nx5QvUirJgnzqMnV13jipSSOyduAQFtafcpelI6t1Qqree3skeWmp9HqxiaIMCkQ0bMSCZBWemHO/7aPoxDEtIr6R/taUr5FuyUYAeBFaQZiosVG1HHrYBLvBqK/ohfCWuhljvM8QIJScJvhRZd3RPZCMi1s/Nbg+GWQWP0mfKB8gxKgqNQ4+lX6FyIP67wBHldUCUA62qIqYoETvjBYJxJ7N09i9mhQDwT3WQD5PEy5AZchaEDWRS9rJHqhTtXU5ClaDAjECw62avSMMuVT2oLLBCwdAI4QL65C1Iz0fo5vWHayjArbNcmTG7N4lBETd76RF5otegmNBs4fd83LHGFFzjSoVFLgn4dGCrQfA1PRc/sKTBw0svdz6dyrFj/QN8/m10vaZXMYwq5Lprafvo3rfoMCwAq6kM4pgQuHxLaLJ5NmX84iGvqI0BKXkqT8cMhuB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199015)(7416002)(8936002)(2616005)(1076003)(186003)(5660300002)(6512007)(41300700001)(26005)(86362001)(921005)(38100700002)(2906002)(36756003)(83380400001)(316002)(107886003)(6666004)(4326008)(66556008)(66946007)(66476007)(8676002)(6506007)(478600001)(6486002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UUDGg7vutawteOS33rR/ch0FrloJKrh+g+2c0d/NyGzz70ilLvg9f9INTOwC?=
 =?us-ascii?Q?AXIiv64WmUIO8Y7gNXnHBo4r16DsPcl/oVPKH99//e+mxr6dI808UjYIe762?=
 =?us-ascii?Q?fHkF/ZmKlX0uud24Yq92/pW/FIW46DYL1x9X7G0bWNXKpMbKjVi9BBi9wZ+H?=
 =?us-ascii?Q?91wFTgsi2giIs8FiTc9EcS6DmU/PQxnvmooOk4Nae9Et8NDBk5tJke4ksyX2?=
 =?us-ascii?Q?H5ee8Bj6mDDCBwVw4+RXIj7JVFR5F1Y5tAHx99uRXdJxp53yd4kDJgtHEF8D?=
 =?us-ascii?Q?wOCrwKX7X+6MuNclqA47SxK6jMDhEjkD8txxDE9lyPP6+MBgsCImPCDAbtep?=
 =?us-ascii?Q?Q20/uddvlRLIXgxmywruz+zYHzdjwddN0uXnczTrmrA+qQ2UqGkdS11SvieD?=
 =?us-ascii?Q?YqU2XhOxwQU1SgTB4xvznRLzQ0wpg6fK5jUeVCjYjZGuUi8B8OgvmOJeZYyD?=
 =?us-ascii?Q?Sp6QlEE7miKn/BcVWCGSn3+GnvZVMueot/2QkkRJmjh3afB9PLoiPAlmr/T0?=
 =?us-ascii?Q?ao/pGnVcffiwUF3QJu+3JoLgG6XMcH6dUqx7tvLmr7NpYBM/JsaCrm7bxVkP?=
 =?us-ascii?Q?0x0Sl0NGwL6dfLs+fDBbR3I3Kk2jSlflbQPbkvWfw1koT04C16jCDkWcBNkc?=
 =?us-ascii?Q?o9jXrFBel5kMHTe/bHbdIIecAjrFGmz7jvHztwzfPuYA0SQ6MSAL9GFYNYJv?=
 =?us-ascii?Q?I3XKj2jkKZO81mi6OcGgrJDsJdJ4WWB7JCkqHAq+WZ78HmR+vKptqu3HwWMw?=
 =?us-ascii?Q?tbnCY9/D8xPWwYLlq1MefKoRSeTqdJ88YSEmM0qw/euzqF7npOTf08jHELK5?=
 =?us-ascii?Q?1PzqMghyn/llyJZ7gvHUnEnKJB11ZoHvFuOFaACdsFahQMucBx6j0hmoqSxp?=
 =?us-ascii?Q?FC7mbwOsOA7t/X3C+KEK4Wdwb49VKJWU3gsZTAc+JXe63shX+sPZrpGBY+pK?=
 =?us-ascii?Q?iGehJ8v+m+rqafbyDXvj9cBqpQcidXAmjvNcESz40ZzP+Qs9gjMGKyQXSpx/?=
 =?us-ascii?Q?elIr5h2Fj2tOjpg2LN8+O0JeOGnImEwfH+mbxqgR/eqJ5YKXQuQJU0XHy9dG?=
 =?us-ascii?Q?ELyMR/elaIDXeIRfNFFDswq7oKWI9QcYC9vxKgFDGbITk113J9i0JNGzfKnW?=
 =?us-ascii?Q?v/ydFxiSpBVBh32g6uIj772XTx/0UoqmzBR6z7IgHWgw6qmQPtx+3EUS5RWj?=
 =?us-ascii?Q?+vzoKKypwALX7rfya9scMWhJ3LzVFEOrrj/lj8ZQO3dec4IcMQsyA4CDRUht?=
 =?us-ascii?Q?PFKswUvxow1wCTdMzQVqaad6gthEEdXLRDtYo36qcV0EvtZ6S7mHRfsr+gwo?=
 =?us-ascii?Q?Nd6BH0p5nHeQXfD/jJtdYwEdfEfu2cn/LA2DYIHUx6ZmvVPYGtdwUw6k0A3W?=
 =?us-ascii?Q?5lA4MTE2ak3Spejssj9Nk8pfvkzTX2eEZexvBhDEg/aAY2/9lN5Qpg2ktGeb?=
 =?us-ascii?Q?0nhy6YFVopmD5/eDiwmdfiWtrd9BsYRUl1Lo6lFajgaiDpGHZOB1baUlhkUm?=
 =?us-ascii?Q?lYh8qzPwuBkfgoFze9k6+z0bDBaqjAfu0xl/ZzE3pqy1RXDjnrkayHIGM1kd?=
 =?us-ascii?Q?kARzMOWricTX5ko0rfbapDa0g/0G/fpXSs/MXg2t8nHc0YUQvzLyplldfrFH?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f21984f-71d8-41a3-d4be-08dab7a89a6f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 23:20:00.1161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQOrGutqRm+nA0aelZ9M6EwurYEYE2FdxA7CpnhBCqtcMTP7yzF5ZFmXIHu0yftJT49Te2QwoQJx7ekblJ6nkwB44jW7327DiB1cKoBC3VU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_08,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210260128
X-Proofpoint-ORIG-GUID: N_EpuJu09MpqxCXPMvSXRaJ6MQPqJ-RF
X-Proofpoint-GUID: N_EpuJu09MpqxCXPMvSXRaJ6MQPqJ-RF
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Mon, 31 Oct 2022 06:38:42 +0000
Subject: [dm-devel] [PATCH v3 08/19] nvme: Move pr code to it's own file
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Mike Christie <michael.christie@oracle.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch moves the pr code to it's own file because I'm going to be
adding more functions and core.c is getting bigger.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/nvme/host/Makefile |   2 +-
 drivers/nvme/host/core.c   | 120 -----------------------------------
 drivers/nvme/host/nvme.h   |   2 +
 drivers/nvme/host/pr.c     | 127 +++++++++++++++++++++++++++++++++++++
 4 files changed, 130 insertions(+), 121 deletions(-)
 create mode 100644 drivers/nvme/host/pr.c

diff --git a/drivers/nvme/host/Makefile b/drivers/nvme/host/Makefile
index e27202d22c7d..06c18a65da99 100644
--- a/drivers/nvme/host/Makefile
+++ b/drivers/nvme/host/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_NVME_FC)			+= nvme-fc.o
 obj-$(CONFIG_NVME_TCP)			+= nvme-tcp.o
 obj-$(CONFIG_NVME_APPLE)		+= nvme-apple.o
 
-nvme-core-y				+= core.o ioctl.o
+nvme-core-y				+= core.o ioctl.o pr.o
 nvme-core-$(CONFIG_NVME_VERBOSE_ERRORS)	+= constants.o
 nvme-core-$(CONFIG_TRACING)		+= trace.o
 nvme-core-$(CONFIG_NVME_MULTIPATH)	+= multipath.o
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index a79fa710d012..2de9c42094a6 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2061,126 +2061,6 @@ static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_ns_info *info)
 	}
 }
 
-static char nvme_pr_type(enum pr_type type)
-{
-	switch (type) {
-	case PR_WRITE_EXCLUSIVE:
-		return 1;
-	case PR_EXCLUSIVE_ACCESS:
-		return 2;
-	case PR_WRITE_EXCLUSIVE_REG_ONLY:
-		return 3;
-	case PR_EXCLUSIVE_ACCESS_REG_ONLY:
-		return 4;
-	case PR_WRITE_EXCLUSIVE_ALL_REGS:
-		return 5;
-	case PR_EXCLUSIVE_ACCESS_ALL_REGS:
-		return 6;
-	default:
-		return 0;
-	}
-}
-
-static int nvme_send_ns_head_pr_command(struct block_device *bdev,
-		struct nvme_command *c, u8 *data, unsigned int data_len)
-{
-	struct nvme_ns_head *head = bdev->bd_disk->private_data;
-	int srcu_idx = srcu_read_lock(&head->srcu);
-	struct nvme_ns *ns = nvme_find_path(head);
-	int ret = -EWOULDBLOCK;
-
-	if (ns) {
-		c->common.nsid = cpu_to_le32(ns->head->ns_id);
-		ret = nvme_submit_sync_cmd(ns->queue, c, data, data_len);
-	}
-	srcu_read_unlock(&head->srcu, srcu_idx);
-	return ret;
-}
-	
-static int nvme_send_ns_pr_command(struct nvme_ns *ns, struct nvme_command *c,
-		u8 *data, unsigned int data_len)
-{
-	c->common.nsid = cpu_to_le32(ns->head->ns_id);
-	return nvme_submit_sync_cmd(ns->queue, c, data, data_len);
-}
-
-static int nvme_pr_command(struct block_device *bdev, u32 cdw10,
-				u64 key, u64 sa_key, u8 op)
-{
-	struct nvme_command c = { };
-	u8 data[16] = { 0, };
-
-	put_unaligned_le64(key, &data[0]);
-	put_unaligned_le64(sa_key, &data[8]);
-
-	c.common.opcode = op;
-	c.common.cdw10 = cpu_to_le32(cdw10);
-
-	if (IS_ENABLED(CONFIG_NVME_MULTIPATH) &&
-	    bdev->bd_disk->fops == &nvme_ns_head_ops)
-		return nvme_send_ns_head_pr_command(bdev, &c, data,
-						    sizeof(data));
-	return nvme_send_ns_pr_command(bdev->bd_disk->private_data, &c, data,
-				       sizeof(data));
-}
-
-static int nvme_pr_register(struct block_device *bdev, u64 old,
-		u64 new, unsigned flags)
-{
-	u32 cdw10;
-
-	if (flags & ~PR_FL_IGNORE_KEY)
-		return -EOPNOTSUPP;
-
-	cdw10 = old ? 2 : 0;
-	cdw10 |= (flags & PR_FL_IGNORE_KEY) ? 1 << 3 : 0;
-	cdw10 |= (1 << 30) | (1 << 31); /* PTPL=1 */
-	return nvme_pr_command(bdev, cdw10, old, new, nvme_cmd_resv_register);
-}
-
-static int nvme_pr_reserve(struct block_device *bdev, u64 key,
-		enum pr_type type, unsigned flags)
-{
-	u32 cdw10;
-
-	if (flags & ~PR_FL_IGNORE_KEY)
-		return -EOPNOTSUPP;
-
-	cdw10 = nvme_pr_type(type) << 8;
-	cdw10 |= ((flags & PR_FL_IGNORE_KEY) ? 1 << 3 : 0);
-	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_acquire);
-}
-
-static int nvme_pr_preempt(struct block_device *bdev, u64 old, u64 new,
-		enum pr_type type, bool abort)
-{
-	u32 cdw10 = nvme_pr_type(type) << 8 | (abort ? 2 : 1);
-
-	return nvme_pr_command(bdev, cdw10, old, new, nvme_cmd_resv_acquire);
-}
-
-static int nvme_pr_clear(struct block_device *bdev, u64 key)
-{
-	u32 cdw10 = 1 | (key ? 0 : 1 << 3);
-
-	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_release);
-}
-
-static int nvme_pr_release(struct block_device *bdev, u64 key, enum pr_type type)
-{
-	u32 cdw10 = nvme_pr_type(type) << 8 | (key ? 0 : 1 << 3);
-
-	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_release);
-}
-
-const struct pr_ops nvme_pr_ops = {
-	.pr_register	= nvme_pr_register,
-	.pr_reserve	= nvme_pr_reserve,
-	.pr_release	= nvme_pr_release,
-	.pr_preempt	= nvme_pr_preempt,
-	.pr_clear	= nvme_pr_clear,
-};
-
 #ifdef CONFIG_BLK_SED_OPAL
 int nvme_sec_submit(void *data, u16 spsp, u8 secp, void *buffer, size_t len,
 		bool send)
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index a29877217ee6..e82be1f1373d 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -19,6 +19,8 @@
 
 #include <trace/events/block.h>
 
+extern const struct pr_ops nvme_pr_ops;
+
 extern unsigned int nvme_io_timeout;
 #define NVME_IO_TIMEOUT	(nvme_io_timeout * HZ)
 
diff --git a/drivers/nvme/host/pr.c b/drivers/nvme/host/pr.c
new file mode 100644
index 000000000000..aa88c55879b2
--- /dev/null
+++ b/drivers/nvme/host/pr.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/blkdev.h>
+#include <linux/pr.h>
+#include <asm/unaligned.h>
+
+#include "nvme.h"
+
+static char nvme_pr_type(enum pr_type type)
+{
+	switch (type) {
+	case PR_WRITE_EXCLUSIVE:
+		return 1;
+	case PR_EXCLUSIVE_ACCESS:
+		return 2;
+	case PR_WRITE_EXCLUSIVE_REG_ONLY:
+		return 3;
+	case PR_EXCLUSIVE_ACCESS_REG_ONLY:
+		return 4;
+	case PR_WRITE_EXCLUSIVE_ALL_REGS:
+		return 5;
+	case PR_EXCLUSIVE_ACCESS_ALL_REGS:
+		return 6;
+	default:
+		return 0;
+	}
+}
+
+static int nvme_send_ns_head_pr_command(struct block_device *bdev,
+		struct nvme_command *c, u8 *data, unsigned int data_len)
+{
+	struct nvme_ns_head *head = bdev->bd_disk->private_data;
+	int srcu_idx = srcu_read_lock(&head->srcu);
+	struct nvme_ns *ns = nvme_find_path(head);
+	int ret = -EWOULDBLOCK;
+
+	if (ns) {
+		c->common.nsid = cpu_to_le32(ns->head->ns_id);
+		ret = nvme_submit_sync_cmd(ns->queue, c, data, data_len);
+	}
+	srcu_read_unlock(&head->srcu, srcu_idx);
+	return ret;
+}
+
+static int nvme_send_ns_pr_command(struct nvme_ns *ns, struct nvme_command *c,
+		u8 *data, unsigned int data_len)
+{
+	c->common.nsid = cpu_to_le32(ns->head->ns_id);
+	return nvme_submit_sync_cmd(ns->queue, c, data, data_len);
+}
+
+static int nvme_pr_command(struct block_device *bdev, u32 cdw10,
+				u64 key, u64 sa_key, u8 op)
+{
+	struct nvme_command c = { };
+	u8 data[16] = { 0, };
+
+	put_unaligned_le64(key, &data[0]);
+	put_unaligned_le64(sa_key, &data[8]);
+
+	c.common.opcode = op;
+	c.common.cdw10 = cpu_to_le32(cdw10);
+
+	if (IS_ENABLED(CONFIG_NVME_MULTIPATH) &&
+	    bdev->bd_disk->fops == &nvme_ns_head_ops)
+		return nvme_send_ns_head_pr_command(bdev, &c, data,
+						    sizeof(data));
+	return nvme_send_ns_pr_command(bdev->bd_disk->private_data, &c, data,
+				       sizeof(data));
+}
+
+static int nvme_pr_register(struct block_device *bdev, u64 old,
+		u64 new, unsigned flags)
+{
+	u32 cdw10;
+
+	if (flags & ~PR_FL_IGNORE_KEY)
+		return -EOPNOTSUPP;
+
+	cdw10 = old ? 2 : 0;
+	cdw10 |= (flags & PR_FL_IGNORE_KEY) ? 1 << 3 : 0;
+	cdw10 |= (1 << 30) | (1 << 31); /* PTPL=1 */
+	return nvme_pr_command(bdev, cdw10, old, new, nvme_cmd_resv_register);
+}
+
+static int nvme_pr_reserve(struct block_device *bdev, u64 key,
+		enum pr_type type, unsigned flags)
+{
+	u32 cdw10;
+
+	if (flags & ~PR_FL_IGNORE_KEY)
+		return -EOPNOTSUPP;
+
+	cdw10 = nvme_pr_type(type) << 8;
+	cdw10 |= ((flags & PR_FL_IGNORE_KEY) ? 1 << 3 : 0);
+	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_acquire);
+}
+
+static int nvme_pr_preempt(struct block_device *bdev, u64 old, u64 new,
+		enum pr_type type, bool abort)
+{
+	u32 cdw10 = nvme_pr_type(type) << 8 | (abort ? 2 : 1);
+
+	return nvme_pr_command(bdev, cdw10, old, new, nvme_cmd_resv_acquire);
+}
+
+static int nvme_pr_clear(struct block_device *bdev, u64 key)
+{
+	u32 cdw10 = 1 | (key ? 0 : 1 << 3);
+
+	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_release);
+}
+
+static int nvme_pr_release(struct block_device *bdev, u64 key, enum pr_type type)
+{
+	u32 cdw10 = nvme_pr_type(type) << 8 | (key ? 0 : 1 << 3);
+
+	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_release);
+}
+
+const struct pr_ops nvme_pr_ops = {
+	.pr_register	= nvme_pr_register,
+	.pr_reserve	= nvme_pr_reserve,
+	.pr_release	= nvme_pr_release,
+	.pr_preempt	= nvme_pr_preempt,
+	.pr_clear	= nvme_pr_clear,
+};
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

