Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 431034B6520
	for <lists+dm-devel@lfdr.de>; Tue, 15 Feb 2022 09:04:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-RI9-NYLFMMSag0AXGJmJfQ-1; Tue, 15 Feb 2022 03:04:18 -0500
X-MC-Unique: RI9-NYLFMMSag0AXGJmJfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41B101006ABF;
	Tue, 15 Feb 2022 08:04:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BEEF10694FB;
	Tue, 15 Feb 2022 08:04:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2DD31806D1C;
	Tue, 15 Feb 2022 08:04:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21F1umk1004729 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 20:56:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4C6CB400E420; Tue, 15 Feb 2022 01:56:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45EA9400E136
	for <dm-devel@redhat.com>; Tue, 15 Feb 2022 01:56:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BB33811E7A
	for <dm-devel@redhat.com>; Tue, 15 Feb 2022 01:56:48 +0000 (UTC)
Received: from APC01-HK2-obe.outbound.protection.outlook.com
	(mail-eopbgr1300125.outbound.protection.outlook.com [40.107.130.125])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-294-4Ea36XjVM6OV-NgugHziGA-1; Mon, 14 Feb 2022 20:56:44 -0500
X-MC-Unique: 4Ea36XjVM6OV-NgugHziGA-1
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
	by PS1PR0601MB1866.apcprd06.prod.outlook.com (2603:1096:803:6::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15;
	Tue, 15 Feb 2022 01:56:37 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
	([fe80::80b4:e787:47a9:41bb]) by
	SL2PR06MB3082.apcprd06.prod.outlook.com
	([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019;
	Tue, 15 Feb 2022 01:56:37 +0000
From: Qing Wang <wangqing@vivo.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org
Date: Mon, 14 Feb 2022 17:55:42 -0800
Message-Id: <1644890154-64915-6-git-send-email-wangqing@vivo.com>
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
	(2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
	(2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eadfbac3-950b-4e51-be2f-08d9f0266665
X-MS-TrafficTypeDiagnostic: PS1PR0601MB1866:EE_
X-Microsoft-Antispam-PRVS: <PS1PR0601MB18668268A528DD80828EFBA2BD349@PS1PR0601MB1866.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: sIoEfQemArsyulB5SoveymUgtCUx2xxzYy8UevUrqedCT7AVUtfGLKgvtMBl0B/j0EFZtGoiarNcH0PsWYj2P+d8+4QAJNKvHrhdlYWVdbc4ixPwQ1jgMreZmSC46pFJccm8h+uCIABXQnQjBDyEod3T9odut8IXpDteejFmeIShKCNcxGrOBoiUa2lyIk7HdzLaQFOoryvMWaKvIzf9sgCVpk/wduHsDQztJD/vhbPWtmuw1UAkiO+6V4gmhZhrjcizlPcNipi/GK4cmFP126zxjn+M3c3Td+PVzFZxS3uec3CDqfVXn4k10jQKHIqrFpnVit1cY6ilZYbqopl9t2P0lz8q4iNK1cPdle6dEHVWChAkoukdmkqW7VnBBXlMe5fT2CCyUQGbMCyXMOtquTaVZfXthJFjT69L5ImDDcsqx6xx1lJ/t8H+HRsDojEe1rsmL0iTwWmMqW83OWJUQuV4DP5tEgAg6J7XFG89MDCuTXKw1sw6EPJ0cTNrxaRjJuPQ+cbh9J5drX4jIP6kDFycWDx3Zwq7XDlA6bNoph+ddqV5CPk0RLIvPfFpRDDiTtVOqnV0mai7+5iyBHerM+utD9M02oxH3OccGhwNLYXoNELDpNuWLwse00MdUTJtpQR71T3cE5Gk2zvu8oQ7U18+4zXsAw6tj4XZzm5mvtOe/R2xGYBtEDsvZXHItmfxXZclirnMiuGLBAXQsW1mh7tJ5Ye0VfTD0GZ3MTqn8C0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(36756003)(2906002)(921005)(38350700002)(38100700002)(8936002)(7416002)(7406005)(4744005)(5660300002)(52116002)(6506007)(6666004)(86362001)(66476007)(66556008)(66946007)(8676002)(4326008)(6512007)(107886003)(26005)(110136005)(316002)(186003)(6486002)(2616005)(83380400001)(508600001);
	DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nuOoN1v5NxJXTwYzMrN0x3sqYLMRiw/LDRy6bOyD0Xsr4hYf8pMsWd+inzLm?=
	=?us-ascii?Q?tvk7emt5UWTwEK1BYfBu657jBKYwT3hnG7o24Rw5CGrlDae2canOwzEsfMs2?=
	=?us-ascii?Q?OLn1tVQR9ETMgGZINxuV+11W7xj5S+Uj4PDDvtQgeXePr+wuXBK7RgzFIdSr?=
	=?us-ascii?Q?JFdgolr7HdX9GSam0zA5nqM13feALzh2IOdiOgULRVFcGsVphYLKfFcu57L4?=
	=?us-ascii?Q?T3PuTvvZe8BXGBozZVPEf6j9Fyz2O0FteBASssgec2qwRmD2EuHxjFPCdcsr?=
	=?us-ascii?Q?zFQTAjFJLvX74qJPfOr0yq0x8ili8Yxt2vDqr+g2LTDQDoK6ClrVm63xxmrK?=
	=?us-ascii?Q?6GpP0PWLfZ+1+CVgGn9eIlRrbxWpOMsY0Bcd/Q8k0phlll+OG8ExcSrUSoAt?=
	=?us-ascii?Q?v4XAK95RND+V+n8sAM61bXuWa1MBIoiB8MPPN6v1NceIYCOqmVhXki8V4han?=
	=?us-ascii?Q?k0w+5PfiCR+q0gbTtzYl46sHlmjyOR2TCNwiExb/YgufOuq4vPnsSop8oJIC?=
	=?us-ascii?Q?0LgZ1RPqqKEDPqEyuQ45zCZB7eYAm+XuR2NxCjCx/rMfR0UkFaIbUXo7mRXn?=
	=?us-ascii?Q?PTtiGmQ9ANpqv2aGpCx3TXQGxNG5uvgYCPJ9Lr7LgFW8tyBqA3VZNjOICK8O?=
	=?us-ascii?Q?6oWfxJlp+E9vMdpPmQk768BLNoaeHP98r40/+U7H0YJu1/0abQrPzgFQuZaO?=
	=?us-ascii?Q?loc4gPoOS6h23+tRLoCmGwtnj6ucRCKeFdIdc+i+KPpzGNCALStkRFiOC8wO?=
	=?us-ascii?Q?klQ7z4/VCNeNGO0zdlywx6Ebq7IUVCCpCP248MxBk2rIuVf05MrM8BCyN1Ze?=
	=?us-ascii?Q?AoL7g+Ts5PFs5TehO/5I92XP+DYEwBMu1ZYsBpOLpa0HxVv69kZld9gyICcc?=
	=?us-ascii?Q?7oLAfv7YdTSIl/gr6u+VBEpqBNNX6q/p5p0U/+KvC3U4/QgCR5/uuRBQ66nJ?=
	=?us-ascii?Q?XMz1PNmarEmtqkkGw22G5OwNeP8v7361cY82qfQDQn5F+ZqQ3u8skqg9+16P?=
	=?us-ascii?Q?Q8Zo1aVdKUkEyySe51etV+ROMLe3bbNx3VWvfMdDoXpsmTHgvHX3/wuAOPdm?=
	=?us-ascii?Q?g/6q6CbmkfT7EP85+nqYZsCiMJMBOKztJByzJWBZy5iI9Sh2q0tDEhoow9bj?=
	=?us-ascii?Q?PplkxGUyMZMyXCRGpMWexmIo2Nom4pUSe8NcMEK9naPbj7KtM20i6J6Hlz9N?=
	=?us-ascii?Q?z0ZxR5E0HD05Es2SL4oO3+Y5au8zBAATmfsAqIB5hCumnRWlDri53SeakIjf?=
	=?us-ascii?Q?qThLforE339HXCtiXDuiLtQZBuoQjG8KEJjZgMchct6s0jchxTiVWKFm6D9U?=
	=?us-ascii?Q?jdXgFQPmUr8bZ47cdbxrvqmLjpo7etnZf23c0PWmOUuEp+8sOy7/L+oI5Uoo?=
	=?us-ascii?Q?VgqcBpkT7PSKX/XNXHknyb/dSnQCiSmcHeKm21MbplM8ivg0IRYGxcECiPUg?=
	=?us-ascii?Q?Y1GzzRYkWWjbaw6XinqqZpbvNMtYIoqTs63d6yTq6RTzRODnYlkvTUs/MA4y?=
	=?us-ascii?Q?eUM2fyH9I3kE+2JWxMmL3xVZ9z4JbJwIMThYHxS+NbOcpW8wBMfam7y1Ze16?=
	=?us-ascii?Q?Gi4aDemijDKIF1eyGtYcCIDe3WPSESgmdpxzQ2vuAMmhcG5srwt+MMqnI9Dc?=
	=?us-ascii?Q?+n0kvf3Zho0xCPx5La9Ka1s=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eadfbac3-950b-4e51-be2f-08d9f0266665
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:36.8565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBSGzwX/ZNVxWcftvmwAeS99h7MtCcwLH0F2V0ZE6zOpA7y9IDcAuvx1RaxR1CS0yG68ht/dIJrg6qqRZNiB4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB1866
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 15 Feb 2022 03:03:41 -0500
Cc: Wang Qing <wangqing@vivo.com>
Subject: [dm-devel] [PATCH V3 5/13] hid: use time_is_after_jiffies() instead
	of open coding it
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Wang Qing <wangqing@vivo.com>

Use the helper function time_is_{before,after}_jiffies() to improve
code readability.

Signed-off-by: Wang Qing <wangqing@vivo.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 8ccb246..15e1423
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -578,7 +578,7 @@ static void _ish_sync_fw_clock(struct ishtp_device *dev)
 	static unsigned long	prev_sync;
 	uint64_t	usec;
 
-	if (prev_sync && jiffies - prev_sync < 20 * HZ)
+	if (prev_sync && time_is_after_jiffies(prev_sync + 20 * HZ))
 		return;
 
 	prev_sync = jiffies;
-- 
2.7.4

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

