Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 09A2D191EF7
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 03:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585103046;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KCQyi8W51qUdj+FliUsW/m1kkMeGVj0m1FaHHWN2gWM=;
	b=gSPZR2rt3wVCbw+1ebRyLuyQ0EHbuoT/clzDiRI8KtTBhlE0NtiaD/gPEuDCWoCJYFLD3/
	mvb8nAwogO+YoE7o7cH1izvOhZKclb453fkGa/V4wYfeJL9yHv+CoTcv45iLZPUEeeX5ut
	WQThlQB5zKZW60audDV7J1syojKSIFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-tgaNcMOXN7OdiGDipj-REg-1; Tue, 24 Mar 2020 22:24:04 -0400
X-MC-Unique: tgaNcMOXN7OdiGDipj-REg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76BB88017CC;
	Wed, 25 Mar 2020 02:23:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A36290766;
	Wed, 25 Mar 2020 02:23:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36655944A4;
	Wed, 25 Mar 2020 02:23:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P2NWx0015883 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 22:23:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FFAF2026D67; Wed, 25 Mar 2020 02:23:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AF2C20316E0
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 02:23:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34EE9101A55A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 02:23:30 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-222-2PQ8_omHOVC-F4YiE3jeOw-1; Tue, 24 Mar 2020 22:23:28 -0400
X-MC-Unique: 2PQ8_omHOVC-F4YiE3jeOw-1
IronPort-SDR: uqYqLkekC/pUNejQoIKVrWYwqsHzaTZ4J7Xy7Djf6gjKjfeiQHbuKyIPombWnmFAynRK9snmbW
	Hj4P+BO8EoI6vyxyVuVJ2eP3UDL0lEctWhb98V63i3gTUI8niwASrYOgWLtqkEIXycypGmRFce
	j3zAjL7zOKybaUnAn1j5Gohc2c6Vx/Uqb+Y+Y/szTHCOl6bjkEKIs/7opDmhTf1tJl3A1l8ss6
	yQEWIMsetK1AP30t8BGgEZoy6B2JtUfWKZT+gCObEnhkazlxqWgHDukuxz0NXqKJ3BZWGCzsy4
	XAU=
X-IronPort-AV: E=Sophos;i="5.72,302,1580745600"; d="scan'208";a="133419834"
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
	by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 10:23:26 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2359.namprd04.prod.outlook.com (2603:10b6:102:a::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Wed, 25 Mar 2020 02:23:24 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.023;
	Wed, 25 Mar 2020 02:23:24 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sasha Levin <sashal@kernel.org>, Bob Liu <bob.liu@oracle.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [PATCH resend] dm zoned: remove duplicated nr_rnd_zones
	increasement
Thread-Index: AQHWAd9y7bntyyl1FkW2/iZtyzwrUw==
Date: Wed, 25 Mar 2020 02:23:24 +0000
Message-ID: <CO2PR04MB2343A87740F1201B0DA3EAE2E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200324132245.27843-1-bob.liu@oracle.com>
	<20200325010157.62A0220719@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5a250248-a74d-4408-092e-08d7d0637f0b
x-ms-traffictypediagnostic: CO2PR04MB2359:
x-microsoft-antispam-prvs: <CO2PR04MB23595F1BF676E0CA2DB6C589E7CE0@CO2PR04MB2359.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(66446008)(64756008)(53546011)(4326008)(66946007)(91956017)(9686003)(66556008)(55016002)(7696005)(66476007)(76116006)(6506007)(316002)(5660300002)(478600001)(52536014)(2906002)(71200400001)(8936002)(33656002)(186003)(81156014)(81166006)(110136005)(8676002)(26005)(54906003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2359;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G2kP1dbEmGURN3XgAFDCDPD1jLwb+M7kPew31GI34s03WzKux0rpeu1dW1/hb5WSUhU85ZRzkgfJzREShG6RFkf6mERC41NMKdDJpTIc1zL7my6G3iw3sBuTgwzslFl2mjbJ9MrDf2YI7/r8JEZdlhbunCElboCgsk0J5iqoc+W+ktrEt5zUpsjhkZIahV9Yq23/QlwKZYadABiPf+RUQAJbZFRJbVOCtfgQRy9negdHq6afDM/Bt5KD00Xl2vxoJidcN5n5vuwKWU+3ytUQBjxzWdodkihbaOzI3Z3id4L3NVCrKcN6YREkRs2YuD6BhAfGWWi4YmGFNNmHk1E7EEr72NLApagAgXkfe5FOW6yjuZGQ/qInF3zMQHQe3KrRIxsnPIaxA67x/DGqqBUW2L0RW5mn5XulmPlMdO7SVLBGo2Mz9Fks/MCUkJa5oXiS
x-ms-exchange-antispam-messagedata: +cbFIS8LnhZ7WdD6tZoA4NExgQ4jZZt/yZwQoH2DRGZ9B+YSkba6SRdF1U+tudsQiB+SRwUsVIe0GYCBwsQZZTaLNIYwVQAJn8v8++M/tPY+Q8OcPrKD6lq3TbtImYo1Remt5IR2ecGAmM9bmVMSWQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a250248-a74d-4408-092e-08d7d0637f0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 02:23:24.6714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0T3VnvaeYRorgXaXGUoyrseV9G/A/3eAXFc0/fMHzSg54WQfUoVBkNdX5zJT0A/jdoejbdar5bfjyaXR4BMGsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2359
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P2NWx0015883
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH resend] dm zoned: remove duplicated
 nr_rnd_zones increasement
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/03/25 10:02, Sasha Levin wrote:
> Hi
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a "Fixes:" tag
> fixing commit: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target").
> 
> The bot has tested the following trees: v5.5.11, v5.4.27, v4.19.112, v4.14.174.
> 
> v5.5.11: Build OK!
> v5.4.27: Failed to apply! Possible dependencies:
>     5eac3eb30c9a ("block: Remove partition support for zoned block devices")
>     6c1b1da58f8c ("block: add zone open, close and finish operations")
>     7fc8fb51a143 ("null_blk: clean up report zones")
>     ad512f2023b3 ("scsi: sd_zbc: add zone open, close, and finish support")
>     c7a1d926dc40 ("block: Simplify REQ_OP_ZONE_RESET_ALL handling")
>     c98c3d09fca4 ("block: cleanup the !zoned case in blk_revalidate_disk_zones")
>     ceeb373aa6b9 ("block: Simplify report zones execution")
>     d41003513e61 ("block: rework zone reporting")
>     d9dd73087a8b ("block: Enhance blk_revalidate_disk_zones()")
>     dd85b4922de1 ("null_blk: return fixed zoned reads > write pointer")
>     e3f89564c557 ("null_blk: clean up the block device operations")
> 
> v4.19.112: Failed to apply! Possible dependencies:
>     515ce6061312 ("scsi: sd_zbc: Fix sd_zbc_report_zones() buffer allocation")
>     5f832a395859 ("scsi: sd_zbc: Fix sd_zbc_check_zones() error checks")
>     a2d6b3a2d390 ("block: Improve zone reset execution")
>     a91e138022bc ("block: Introduce blkdev_nr_zones() helper")
>     bd976e527259 ("block: Kill gfp_t argument of blkdev_report_zones()")
>     bf5054569653 ("block: Introduce blk_revalidate_disk_zones()")
>     d2e428e49eec ("scsi: sd_zbc: Reduce boot device scan and revalidate time")
>     d41003513e61 ("block: rework zone reporting")
>     e76239a3748c ("block: add a report_zones method")
> 
> v4.14.174: Failed to apply! Possible dependencies:
>     08e18eab0c57 ("block: add bi_blkg to the bio for cgroups")
>     30e5e929c7bf ("nvme: don't pass struct nvme_ns to nvme_config_discard")
>     5238dcf4136f ("block: replace bio->bi_issue_stat with bio-specific type")
>     53cfdc10a95d ("blk-throttle: fix null pointer dereference while throttling writeback IOs")
>     5d47c89f29ea ("dm: clear all discard attributes in queue_limits when discards are disabled")
>     8b904b5b6b58 ("block: Use blk_queue_flag_*() in drivers instead of queue_flag_*()")
>     a2d6b3a2d390 ("block: Improve zone reset execution")
>     b889bf66d001 ("blk-throttle: track read and write request individually")
>     bd976e527259 ("block: Kill gfp_t argument of blkdev_report_zones()")
>     bf5054569653 ("block: Introduce blk_revalidate_disk_zones()")
>     c8b5fd031a30 ("mmc: block: Factor out mmc_setup_queue()")
>     d41003513e61 ("block: rework zone reporting")
>     d70675121546 ("block: introduce blk-iolatency io controller")
>     e447a0151f7c ("zram: set BDI_CAP_STABLE_WRITES once")
>     ed754e5deeb1 ("nvme: track shared namespaces")
> 
> 
> NOTE: The patch will not be queued to stable trees until it is upstream.
> 
> How should we proceed with this patch?
> 

Fixing the conflict is simple. Bob or I can do it when Greg processes
the patch once it is upstream ? Usually Greg sends a notice for such
patches that do not apply cleanly.

For reference, the fixed up patch for 4.19 is below.

commit 48414897d7fde2c2a561a9f6d4b58b62ccb63e68 (HEAD -> linux-4.19.y)
Author: Bob Liu <bob.liu@oracle.com>
Date:   Tue Mar 24 21:22:45 2020 +0800

    dm zoned: remove duplicated nr_rnd_zones increasement

    zmd->nr_rnd_zones was increased twice by mistake.
    The other place:
    1131                 zmd->nr_useable_zones++;
    1132                 if (dmz_is_rnd(zone)) {
    1133                         zmd->nr_rnd_zones++;
                                            ^^^

    Cc: stable@vger.kernel.org
    Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
    Signed-off-by: Bob Liu <bob.liu@oracle.com>
    Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 086a870087cf..53eb21343b11 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1105,7 +1105,6 @@ static int dmz_init_zone(struct dmz_metadata *zmd, struct dm_zone *zone,

        if (blkz->type == BLK_ZONE_TYPE_CONVENTIONAL) {
                set_bit(DMZ_RND, &zone->flags);
-               zmd->nr_rnd_zones++;
        } else if (blkz->type == BLK_ZONE_TYPE_SEQWRITE_REQ ||
                   blkz->type == BLK_ZONE_TYPE_SEQWRITE_PREF) {
                set_bit(DMZ_SEQ, &zone->flags);



-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

