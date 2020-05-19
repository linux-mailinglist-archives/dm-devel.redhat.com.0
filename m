Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A274C1D8E30
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 05:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589858737;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ym98yPLvgayIvR958JcDsARNqD+qCx+8AYo5Nq+246c=;
	b=dXSJfKZpDUu11LM05XL2Wfg5DzC5ZGtz+yQT0Z/Tb0oGkO9VuFNkG5fo1vAZIQNCm26Zog
	ZyUBiy7F0P62UxWYWyDKZXS3TM14ZGcobfRfytcLhvM4TxRfcDwCXDqOrMVwW/MyD+aNa4
	YVjnp5481PmDpDnl+dxSbUIrwjS1FzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-ZEj2SxCCPo-sv-kXQ1WwGg-1; Mon, 18 May 2020 23:25:34 -0400
X-MC-Unique: ZEj2SxCCPo-sv-kXQ1WwGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D04880058A;
	Tue, 19 May 2020 03:25:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6FED60BE1;
	Tue, 19 May 2020 03:25:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4851B1809543;
	Tue, 19 May 2020 03:25:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J3PFCe014039 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 23:25:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0351E2EFAA; Tue, 19 May 2020 03:25:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C032EF9A
	for <dm-devel@redhat.com>; Tue, 19 May 2020 03:25:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10D3B8C07ED
	for <dm-devel@redhat.com>; Tue, 19 May 2020 03:25:11 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-51-K2PvRnrNNk6yw-nNA5KyhQ-1; Mon, 18 May 2020 23:25:08 -0400
X-MC-Unique: K2PvRnrNNk6yw-nNA5KyhQ-1
IronPort-SDR: n1vml7kBnboEYLi4gDPw1OhbLPIq4me+APN3aPJRAMr8WDTY7UdjVDK9H/2hhYWwZ86nhI0WP2
	bniVs7/3wSFPlMIB6q/0Soi3LycXue+fWUCxsvRLMOUh9CiTwENKObkArftpcv2r8LfMtfe7GT
	XqooPqjtL/ZPDsbfqZU5iqPrv+KrQPX2NIMy73vFsDL8oahUwd/BDofkShv5Vx/LD0E8aHxpDb
	kFSM6GcVkjebGJp82S+/S9GI1v1aliDuzMRS79ixVr8wmpbw5jHdDJiEBOysEfJzh39ZN5S/j5
	174=
X-IronPort-AV: E=Sophos;i="5.73,408,1583164800"; d="scan'208";a="139437409"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
	by ob1.hgst.iphmx.com with ESMTP; 19 May 2020 11:24:58 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6868.namprd04.prod.outlook.com (2603:10b6:a03:21a::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25;
	Tue, 19 May 2020 03:24:44 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.034;
	Tue, 19 May 2020 03:24:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [dm:dm-5.8 47/54] drivers/md/dm-zoned-reclaim.c:350:18: warning:
	variable 'dev' set but not used
Thread-Index: AQHWLYwtLJidAQr3WkGcWViheT9mMA==
Date: Tue, 19 May 2020 03:24:44 +0000
Message-ID: <BY5PR04MB69001E3E05E6456E00802FD1E7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <202005191101.djuJIqn4%lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 45a89365-e29d-4871-4f36-08d7fba42cec
x-ms-traffictypediagnostic: BY5PR04MB6868:
x-microsoft-antispam-prvs: <BY5PR04MB68682B36245D24950BA6951CE7B90@BY5PR04MB6868.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:63;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jvqu0Izf1hsOoWVKBXis+aHFKIcwX+3/rwkqZyoMR/8NbLqJ7l8qFzBwga3SC0rbFPOvPT83bixH4GaZOviq1ulckjCV6Dg9H5c5eyPO8jKzftJ9lKu6IF5HImqhVWs+o2WHkUBwqPVblQfDWjRTFVd26kOjiGk0oiIW/xCtjgamXygBiVrhzEQM/MJyVUL0TTpG+BIa2B5XmLkF5SNmEOov9+Kp6VVQcwAC7j6K4G5k8F6YHj85iUwgOZqLXQTdGOa0ulobTX77DSigyDvvMYYa4znW87pM+N/RVO6Qk0JdXyDIuFnDw+Cgau2+rBgOrUVbUoiZMRD8suOy+y/kyb5KXRTZzMJK00O9+qOGp70qR4xu1DSxDomXNV5jBaZv2Gx1FjBPhmrRuSnhwqeDQuUzy1AmgT1RKT0iR26FEn1cNXq7guS+HcERt98ZY5VMHIkk194TNjt4gwfSwWCx+zY+PLeChvFrOh1O8HIwF5AGURdf5y6F6orEHfLmo2ERwFMmWO8qwjB5HyJU7roAlA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(5660300002)(52536014)(4326008)(9686003)(33656002)(66446008)(83080400001)(6916009)(64756008)(66556008)(66946007)(66476007)(55016002)(54906003)(316002)(8936002)(8676002)(2906002)(76116006)(7696005)(6506007)(53546011)(86362001)(26005)(186003)(478600001)(71200400001)(966005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: qs7K2SyzRtvBIUOhWtgM1egO3+6n9Mk28/DNRu97NtG/NuWo6gdfBUn7aJhM4AMD+FRLGESelUFZNn/dwh9GMIcpi0rpzWkfVbfWPoeuYjXBzYKRpL9KJboRkluE2PqpU+vOouEU2sZr01iNsZ6yIjeLHViYcVBaIP+WOtHIhJnCXGD7sIQWjt7yPl3f0Wbn3TxTIoo8Ogfn2Le6W8QkERKH0bzhCeOx4l4NQ2T1HGbt/vkFk2ykk6idzBgm+jNau89doTto5vJrtydpst87fBCdysaUeG2eqq1NKHUGlg1qyzHeFVp4ZEFaT51yuZcF1W6bk9AYSHlJedOCXmnpAgRLV+y3nRXQTSfXCG6IPbUjGfvJOifP5wMmZWBTKeNcPOkxKu0eKMbe+m6ZK+xsNoQoMFKbuSz8m9zTs6wuAWA6Q25HWyho4WoWVAzBDThR+GKhYXQEfkUIafJwfPEsSGqIgSN7aMcJP79DYMjzClmut26u3uPPtRGDKu3IjF6c
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a89365-e29d-4871-4f36-08d7fba42cec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 03:24:44.1623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2hduSnottMfl1ofZHdZH0jUfM0PqFqBxvt21OtYNZTjplt+wgX1cdoH8Bi20tPRUqfGF6EGtBidFWj7kGO+l9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6868
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04J3PFCe014039
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>, Bob Liu <bob.liu@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [dm:dm-5.8 47/54]
 drivers/md/dm-zoned-reclaim.c:350:18: warning: variable 'dev' set but not
 used
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/19 12:18, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git dm-5.8
> head:   44eaf01834bc7414ab5298d097ed4e142a714420
> commit: 21a33c39f41e5fc4e9ecfdf958190c9dc4a86b94 [47/54] dm zoned: remove 'dev' argument from reclaim
> config: parisc-randconfig-r024-20200519 (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 21a33c39f41e5fc4e9ecfdf958190c9dc4a86b94
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> In file included from include/linux/mm.h:94,
> from include/linux/bvec.h:13,
> from include/linux/blk_types.h:10,
> from include/linux/genhd.h:19,
> from include/linux/blkdev.h:11,
> from drivers/md/dm-zoned.h:12,
> from drivers/md/dm-zoned-reclaim.c:8:
> include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
> arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
> 96 |   pte_t old_pte;              |         ^~~~~~~
> arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'set_pte_at'
> 322 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
> |                                  ^~~~~~~~~~
> include/asm-generic/pgtable.h:201:2: note: in expansion of macro 'pte_clear'
> 201 |  pte_clear(mm, address, ptep);
> |  ^~~~~~~~~
> include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
> arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
> 96 |   pte_t old_pte;              |         ^~~~~~~
> include/asm-generic/pgtable.h:640:2: note: in expansion of macro 'set_pte_at'
> 640 |  set_pte_at(vma->vm_mm, addr, ptep, pte);
> |  ^~~~~~~~~~
> drivers/md/dm-zoned-reclaim.c: In function 'dmz_do_reclaim':
>>> drivers/md/dm-zoned-reclaim.c:350:18: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
> 350 |  struct dmz_dev *dev;
> |                  ^~~

It is indeed unused. I wonder why gcc 10 did not complain for me...

Hannes, can you add a patch fixing that when you resend the cache-zone series ?

> 
> vim +/dev +350 drivers/md/dm-zoned-reclaim.c
> 
>    341	
>    342	/*
>    343	 * Find a candidate zone for reclaim and process it.
>    344	 */
>    345	static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>    346	{
>    347		struct dmz_metadata *zmd = zrc->metadata;
>    348		struct dm_zone *dzone;
>    349		struct dm_zone *rzone;
>  > 350		struct dmz_dev *dev;
>    351		unsigned long start;
>    352		int ret;
>    353	
>    354		/* Get a data zone */
>    355		dzone = dmz_get_zone_for_reclaim(zmd);
>    356		if (IS_ERR(dzone))
>    357			return PTR_ERR(dzone);
>    358	
>    359		start = jiffies;
>    360		dev = dmz_zone_to_dev(zmd, dzone);
>    361		if (dmz_is_rnd(dzone)) {
>    362			if (!dmz_weight(dzone)) {
>    363				/* Empty zone */
>    364				dmz_reclaim_empty(zrc, dzone);
>    365				ret = 0;
>    366			} else {
>    367				/*
>    368				 * Reclaim the random data zone by moving its
>    369				 * valid data blocks to a free sequential zone.
>    370				 */
>    371				ret = dmz_reclaim_rnd_data(zrc, dzone);
>    372			}
>    373			rzone = dzone;
>    374	
>    375		} else {
>    376			struct dm_zone *bzone = dzone->bzone;
>    377			sector_t chunk_block = 0;
>    378	
>    379			ret = dmz_first_valid_block(zmd, bzone, &chunk_block);
>    380			if (ret < 0)
>    381				goto out;
>    382	
>    383			if (ret == 0 || chunk_block >= dzone->wp_block) {
>    384				/*
>    385				 * The buffer zone is empty or its valid blocks are
>    386				 * after the data zone write pointer.
>    387				 */
>    388				ret = dmz_reclaim_buf(zrc, dzone);
>    389				rzone = bzone;
>    390			} else {
>    391				/*
>    392				 * Reclaim the data zone by merging it into the
>    393				 * buffer zone so that the buffer zone itself can
>    394				 * be later reclaimed.
>    395				 */
>    396				ret = dmz_reclaim_seq_data(zrc, dzone);
>    397				rzone = dzone;
>    398			}
>    399		}
>    400	out:
>    401		if (ret) {
>    402			dmz_unlock_zone_reclaim(dzone);
>    403			return ret;
>    404		}
>    405	
>    406		ret = dmz_flush_metadata(zrc->metadata);
>    407		if (ret) {
>    408			DMDEBUG("(%s): Metadata flush for zone %u failed, err %d\n",
>    409				dmz_metadata_label(zmd), rzone->id, ret);
>    410			return ret;
>    411		}
>    412	
>    413		DMDEBUG("(%s): Reclaimed zone %u in %u ms",
>    414			dmz_metadata_label(zmd),
>    415			rzone->id, jiffies_to_msecs(jiffies - start));
>    416		return 0;
>    417	}
>    418	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

