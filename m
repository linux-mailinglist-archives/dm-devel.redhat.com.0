Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630353E114
	for <lists+dm-devel@lfdr.de>; Mon,  6 Jun 2022 08:46:28 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-aTAdxfYxPFut4W0zzYS2Xg-1; Mon, 06 Jun 2022 02:46:26 -0400
X-MC-Unique: aTAdxfYxPFut4W0zzYS2Xg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35D863C7B123;
	Mon,  6 Jun 2022 06:46:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07C02416144;
	Mon,  6 Jun 2022 06:46:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CAC641947B9C;
	Mon,  6 Jun 2022 06:46:18 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E48C1947040
 for <dm-devel@listman.corp.redhat.com>; Fri,  3 Jun 2022 07:55:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5F3FA40EC002; Fri,  3 Jun 2022 07:55:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A4F740EC000
 for <dm-devel@redhat.com>; Fri,  3 Jun 2022 07:55:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C6202809CDC
 for <dm-devel@redhat.com>; Fri,  3 Jun 2022 07:55:45 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-E-t5oSkFOqSe3b-nUQAB-w-1; Fri, 03 Jun 2022 03:55:43 -0400
X-MC-Unique: E-t5oSkFOqSe3b-nUQAB-w-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2536WAcT031063;
 Fri, 3 Jun 2022 06:55:51 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbc4xv7sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jun 2022 06:55:51 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2536oNha025389; Fri, 3 Jun 2022 06:55:50 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gc8p5nyqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jun 2022 06:55:50 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 BYAPR10MB2789.namprd10.prod.outlook.com (2603:10b6:a03:82::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.19; Fri, 3 Jun 2022 06:55:47 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b%3]) with mapi id 15.20.5293.019; Fri, 3 Jun 2022
 06:55:47 +0000
From: Mike Christie <michael.christie@oracle.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com, snitzer@kernel.org,
 hch@lst.de, axboe@kernel.dk, martin.petersen@oracle.com,
 james.bottomley@hansenpartnership.com, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org
Date: Fri,  3 Jun 2022 01:55:27 -0500
Message-Id: <20220603065536.5641-3-michael.christie@oracle.com>
In-Reply-To: <20220603065536.5641-1-michael.christie@oracle.com>
References: <20220603065536.5641-1-michael.christie@oracle.com>
X-ClientProxiedBy: DM5PR16CA0012.namprd16.prod.outlook.com
 (2603:10b6:3:c0::22) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13013204-413d-48a1-8ba6-08da452e1658
X-MS-TrafficTypeDiagnostic: BYAPR10MB2789:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2789185C0922F9352152EAB7F1A19@BYAPR10MB2789.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: PyoYuQoFsqLXXhbBY3e9lZfKhmG3uswM53GkJZqQLeZmvKIDGYDyvMc4w95PviNFeggdruNW6JHRvCz3Zt+MG2LKq6gwbMV5PRxXm+yveULHX094FfirC/OpIKczwpwyt44REf3CxyGqfDhJqD8sq74Fm0TaOoOdTRf9rhrOeheqGxSNcew6PXrJWb8i9YoLPLW5kZV4y1bhVGB4hSq9QmmnnJv5hXfILfUTzSx/NMBJ6Vyni5eHKD40LZznfaFD6/6/acj+JZVpoYx7OGwbOztBNtbmQUXPi+AAi7jV6me3cUMOtmuVPHNTyj0t7KBeN0wlSVjJ7VOBfh3Irz9sT0zmR8gy5/7lcrqgt/0PFUDAMpsdX2jlQ/Z1YIrMCTwcHlCcjAqiubmcO9S/aZ26LKtksVJhvOX8PkGwDHjf3b+0Nzk0KxISv9Hg6fG8hTFHiw4UGEzXjGSnRNFvuQrpAhLHyLv0f9P8bNySCLOMsyUCEWvmu8cI0OwKe6EMbWnRuoTL8FML4M8KjtQ9pYt5RNcZ/lt6BU2xiF2wuZox0DOCXTMf5/Y54QjGMcl/vtVvdEVraXUBaD2wUYAZHv0phPhl8C5shYP29tZ5ta+miCP5wSUvuXt88h/gqqVhxaboi+oVKABRlAHk8LFuK0gWe/mIrrEEnRO3z22qXpu3w1WV7hAd1oJiU3hL1yB0pMp5+T4KVtA3kKL6GLZ66SpL2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(8676002)(38350700002)(38100700002)(66476007)(4326008)(66556008)(86362001)(83380400001)(36756003)(8936002)(107886003)(6486002)(2616005)(316002)(5660300002)(1076003)(6512007)(26005)(2906002)(6506007)(52116002)(186003)(6666004)(508600001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gNj80u2XJHDo2tF64dtrYCqQhFgi6E7UROY973/MD5GG9plsgHBmdE0GlpKB?=
 =?us-ascii?Q?XIvdxa8TzDM3ElrQqBxJkkqO9aOq/vbBQshm33KGxGZKkuRyZnmesgMU5g0u?=
 =?us-ascii?Q?AIyCwnjr1U/pqgIT61qTkqYSzrY6TRrNYabh2tYJfcevZAsKYDEEtHczLxUN?=
 =?us-ascii?Q?4+5DWHIa+TWM/Zw4/QI2Z5hgHyV3mf78kzXHsSC0pNhQECuKIudpfXb84N0o?=
 =?us-ascii?Q?fUscnKWwwfJj0nal8U2zNTnPaNwEy1zFYc9gA6mabh61swG0Dvx9CRwrYgwx?=
 =?us-ascii?Q?hEuiBPDe6nb8uV/L/h/to0+0o45Ap3IdAV3tlDAzI2O2hwTD0wlbRI6E5xms?=
 =?us-ascii?Q?8VWZQPq2eYXqiR2z6+zMk62UUiXS16Hkm1cKXR/upNrTuX+KOqeJAZB0XMn2?=
 =?us-ascii?Q?VmN8Z/gYvhJpYLDn7CZtTX12o661YLnqKUkXk6i34WqSUCAjg514Bat5Il4B?=
 =?us-ascii?Q?EFOLLHjrQxbk1OdXqpIhNvv3m2q5hZLaZCJNSY5bcJ3/T9z6IllklqT213wU?=
 =?us-ascii?Q?WGXHK3dOGku5sY8TE5oulaoGbiM8PcN9Oqur85eAY3fijblgb5c8NwGjdzJ+?=
 =?us-ascii?Q?vgCH4zfbYq7JdSz3nun6WCks51gRHFdTvQu4TLrAutrSlb5A3MlENoXpzVQ+?=
 =?us-ascii?Q?beOqVSuTdnGrj8WYM9hrULpNKHEOrsdqFMTYyFk6qSJB+LOuRP1wyFxfXlSf?=
 =?us-ascii?Q?ZyymRf0C3bNJMUsBOlvfbhhqXHwRr0Zmo7ivfF+s6DWHyq5aG6SeFLV2xnUW?=
 =?us-ascii?Q?vnjgAOkjHVFbpnouTdEYULGKWslmzGRcCYHM4LDWPgRXpeVBPU5tZhEDEOH1?=
 =?us-ascii?Q?gWO3BJ+92E6bc37jo4b/lxIdtFTzPEESLSQuoD/TgQbRApimkhDShRWs03Mb?=
 =?us-ascii?Q?62vk6qLdQGmf5eti5zwavJR6uo35G8eQLCAbtZ9ewLka9Xr8sfx226lP4lvw?=
 =?us-ascii?Q?KuGn3Z0rOzmM2DJC+7jdeGr9H2KPpHg+3tL3UQfwZhHhCv31fkPRAkyxR3/7?=
 =?us-ascii?Q?g/CwWIIM73w7JG2fovUYOES4QdZYCI5PMBCF2m2M90hLx2u2GCmVUhZz/TMT?=
 =?us-ascii?Q?GqXWvT3oA0Pc3TK/YYPkK2aHdPKs7H3VT1e3GumXkn56Wz/TpJqILBFMRr8a?=
 =?us-ascii?Q?995QEX5wKf4lcEzw2gQtUcfxi9Jy+vR8C2UWBXO54jA2RfZOGO6TSOe1aJl5?=
 =?us-ascii?Q?4onSN05ozc057Mw638QdPqCL8jKuhkvHpfHHtrVXdV44xlA/920MFY+SPgV3?=
 =?us-ascii?Q?C64uuljpWGSdkdHV3sFEj3qNwMkZFQvJgbEG30Ux0A1TQpjJEhA5V+8Odg6Z?=
 =?us-ascii?Q?OQcwtYD7/I2SwzpqXY+bkqtju3obskvRZkOpsrTtHAdsoWzs14kUkzXjEsO6?=
 =?us-ascii?Q?TzgoHcgI8IYOnxUxlcowEBLOXESfttqnupIexEjYiTG5LnCw/16KfTQquzaP?=
 =?us-ascii?Q?4RZmjgIT9csjzAVrw2qfA/UIWETpPrv4LlVvL+WTZhrqe1tWFHF9JQAjX4wx?=
 =?us-ascii?Q?Vjypon2SY9WAVuFuoWFndhAehSae22BUQ3VB556jBZH+cFp/S5yCYyrBzvM9?=
 =?us-ascii?Q?SxLN01ETgJSEZkp0502gdNfoYY5SP7g4uTHxtKL0qmGPBh6iCDPKsiJ007hu?=
 =?us-ascii?Q?K+NveHZYhY6ec6q3gB7a3Uvk4p2RbsZsvY6HRUwWJc0/yzC5VaFmDV7haeA8?=
 =?us-ascii?Q?J2tGXOD32aEvvLwlIOBr3c5LwOOVtaEr5cEPBki89pf3EcdSYc9fkUugaJzr?=
 =?us-ascii?Q?/RrH/CA9lgDWQwFnGO9Yh6Oi04RJHyQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13013204-413d-48a1-8ba6-08da452e1658
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 06:55:47.3622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuOX49pnZXy7ArwaM5/M3zmaxf77nIsxK19EfEsxLbi72SCGMrzcbk48KSp3gmYfDdK3qf2cnPoTnGoNPC6aYcNYWbDWR/n5kQZ2E31AZGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2789
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-03_02:2022-06-02,
 2022-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206030029
X-Proofpoint-GUID: 2mA602Lx5tx4xaov-SEWvrPdlvWNQOU0
X-Proofpoint-ORIG-GUID: 2mA602Lx5tx4xaov-SEWvrPdlvWNQOU0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Mon, 06 Jun 2022 06:46:16 +0000
Subject: [dm-devel] [PATCH 02/11] scsi: Rename sd_pr_command.
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename sd_pr_command to sd_pr_out_command to match a
sd_pr_in_command helper added in the next patches.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/scsi/sd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index dc6e55761fd1..24e61647064c 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1703,7 +1703,7 @@ static char sd_pr_type(enum pr_type type)
 	}
 };
 
-static int sd_pr_command(struct block_device *bdev, u8 sa,
+static int sd_pr_out_command(struct block_device *bdev, u8 sa,
 		u64 key, u64 sa_key, u8 type, u8 flags)
 {
 	struct scsi_disk *sdkp = scsi_disk(bdev->bd_disk);
@@ -1739,7 +1739,7 @@ static int sd_pr_register(struct block_device *bdev, u64 old_key, u64 new_key,
 {
 	if (flags & ~PR_FL_IGNORE_KEY)
 		return -EOPNOTSUPP;
-	return sd_pr_command(bdev, (flags & PR_FL_IGNORE_KEY) ? 0x06 : 0x00,
+	return sd_pr_out_command(bdev, (flags & PR_FL_IGNORE_KEY) ? 0x06 : 0x00,
 			old_key, new_key, 0,
 			(1 << 0) /* APTPL */);
 }
@@ -1749,24 +1749,24 @@ static int sd_pr_reserve(struct block_device *bdev, u64 key, enum pr_type type,
 {
 	if (flags)
 		return -EOPNOTSUPP;
-	return sd_pr_command(bdev, 0x01, key, 0, sd_pr_type(type), 0);
+	return sd_pr_out_command(bdev, 0x01, key, 0, sd_pr_type(type), 0);
 }
 
 static int sd_pr_release(struct block_device *bdev, u64 key, enum pr_type type)
 {
-	return sd_pr_command(bdev, 0x02, key, 0, sd_pr_type(type), 0);
+	return sd_pr_out_command(bdev, 0x02, key, 0, sd_pr_type(type), 0);
 }
 
 static int sd_pr_preempt(struct block_device *bdev, u64 old_key, u64 new_key,
 		enum pr_type type, bool abort)
 {
-	return sd_pr_command(bdev, abort ? 0x05 : 0x04, old_key, new_key,
+	return sd_pr_out_command(bdev, abort ? 0x05 : 0x04, old_key, new_key,
 			     sd_pr_type(type), 0);
 }
 
 static int sd_pr_clear(struct block_device *bdev, u64 key)
 {
-	return sd_pr_command(bdev, 0x03, key, 0, 0, 0);
+	return sd_pr_out_command(bdev, 0x03, key, 0, 0, 0);
 }
 
 static const struct pr_ops sd_pr_ops = {
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

