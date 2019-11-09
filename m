Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA2FF5D1F
	for <lists+dm-devel@lfdr.de>; Sat,  9 Nov 2019 03:56:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573268186;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AtIttBVRAvMODDPliOswoKJ1pQopn2TbuHXFo92Mj9Y=;
	b=HCUWrehN5N5UAONVLOClwrd81Zi69nxvhvZxirO7LBaE65SUJxtEIMvgYH+8W+ASXlGLNY
	gum0bHoq5M5CEaUiigSXIgEg2KjCpyWNw9pwhpJP6mctfpFM/W6ju81kcfoi+ZEzOXwCGl
	QjJMCKNQBemBS7mKvRynE3Gjj8rrQu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-DfDwlJIaNaO64Thz-FsN2Q-1; Fri, 08 Nov 2019 21:56:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CC408017DE;
	Sat,  9 Nov 2019 02:56:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E71B41001902;
	Sat,  9 Nov 2019 02:56:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 203604BB5C;
	Sat,  9 Nov 2019 02:56:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA92tlfo027631 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 21:55:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC7B0600CA; Sat,  9 Nov 2019 02:55:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AC8D600C9;
	Sat,  9 Nov 2019 02:55:43 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 286C5878E45;
	Sat,  9 Nov 2019 02:55:16 +0000 (UTC)
IronPort-SDR: JbZqacJYvB6LIVBQxQobo+fNuKz77tZLPVpydHynQd9ADS9UUTawx27UIlL4j86mxleL/IJGrp
	pSMeXuPxIGI6XLmI4p+ymggaF1GPxSNhNzN8t817MmBSdcRbz9B9nS8Vqq54ejDm6fbgn8jdAr
	3hLb2kh16miRoLaSS6+oSxmiWetPhLF9m5X3V0/cPDysAAFE6YwID28PhLFAu6Bz3MUcla1s2M
	LH8Cf1iQF02wKlshYb4EGozODNIAyvfhxfU0k9ZPtgMVwjHB0XZneV6MqGbEjzNnoiQziBviqh
	470=
X-IronPort-AV: E=Sophos;i="5.68,283,1569254400"; d="scan'208";a="122553191"
Received: from mail-sn1nam02lp2059.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.59])
	by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2019 10:55:00 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5399.namprd04.prod.outlook.com (20.178.49.81) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.20; Sat, 9 Nov 2019 02:54:58 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2430.023;
	Sat, 9 Nov 2019 02:54:58 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Thread-Topic: [dm-devel] [PATCH 8/9] scsi: sd_zbc: Cleanup
	sd_zbc_alloc_report_buffer()
Thread-Index: AQHVldffBc5Ki7sIvUSBN93lS3Roqw==
Date: Sat, 9 Nov 2019 02:54:58 +0000
Message-ID: <BYAPR04MB5816C442BE08F9973C2CDF15E77A0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-9-damien.lemoal@wdc.com>
	<6a1e0a08-d65c-b075-9bac-23519e9e91c3@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2ba0ce0b-ffea-4a0b-a89f-08d764c03522
x-ms-traffictypediagnostic: BYAPR04MB5399:
x-microsoft-antispam-prvs: <BYAPR04MB5399FE791B868154F480E0BFE77A0@BYAPR04MB5399.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 021670B4D2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(199004)(189003)(229853002)(186003)(2501003)(64756008)(76116006)(7416002)(66446008)(66476007)(71190400001)(71200400001)(99286004)(478600001)(7696005)(66556008)(256004)(14444005)(446003)(86362001)(476003)(91956017)(66946007)(486006)(305945005)(7736002)(9686003)(74316002)(3846002)(6116002)(4744005)(33656002)(55016002)(6246003)(14454004)(6436002)(5660300002)(102836004)(76176011)(8936002)(2906002)(81156014)(110136005)(66066001)(81166006)(53546011)(6506007)(316002)(25786009)(26005)(8676002)(52536014)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5399;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NpsmcKm5loFjUW6HJU4oa8eVTlqHZQdoDKtmbkCEAbxh7CL61bPKOJpCWkk3qQoSSyHpYziMQroipEkP4hJkw9Q7awq8/nzwgMpu6XU6tCCJbgZhY8BXyFqBPiDpBJhE6lFKdsLbegeYKuo1uoYIyoLs+0Vbhf9Uu/nQ7x+W7PgtQonwEJi/hs4qME0WgZIr/OH7uLHKWIlXTmxSVO066e3XP4jqL/zCjkpR5rJn0/0YN+8ND11LZbwUVfcZhnl5lHyZXDg7tHbumfeJsyqP0uPJ4P48KXf3hMJnvMbyQ/AmwLkx7M532F897rMcTMHG246QFZgDVqkUEvSJFAJfaRDLBxPZgsgoUdFus5xwjmFxvMx/Na9UaEsm+7DjYkyjYEjdPfXDf04Ji9iljJ8+a8cFqiVBO9UAzf5d3g0h3awcpRXgBCpPWhEPlqSDCejk
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba0ce0b-ffea-4a0b-a89f-08d764c03522
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2019 02:54:58.2627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vfQqGPa7XDHQA37emap82qTB9qdIx+KD13Nnm6OW+Gn/zHGkRIgJbb+FuV0dfSWUTpwkj5OenBPYLWgjlSWEgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5399
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Sat, 09 Nov 2019 02:55:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Sat, 09 Nov 2019 02:55:32 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com
	216.71.154.42 esa4.hgst.iphmx.com
	<prvs=2093a983d=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA92tlfo027631
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 8/9] scsi: sd_zbc: Cleanup
 sd_zbc_alloc_report_buffer()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: DfDwlJIaNaO64Thz-FsN2Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2019/11/09 4:06, Bart Van Assche wrote:
> On 11/7/19 5:57 PM, Damien Le Moal wrote:
>> -	buf = vzalloc(bufsize);
>> -	if (buf)
>> -		*buflen = bufsize;
>> +	while (bufsize >= SECTOR_SIZE) {
>> +		buf = vzalloc(bufsize);
>> +		if (buf) {
>> +			*buflen = bufsize;
>> +			return buf;
>> +		}
>> +		bufsize >>= 1;
>> +	}
> 
> Hi Damien,
> 
> Has it been considered to pass the __GFP_NORETRY flag to this vzalloc() 
> call?

Do you mean using

__vmalloc(bufsize,
	  GFP_KERNEL | __GFP_ZERO | __GFP_NORETRY, PAGE_KERNEL);

instead of vzalloc() ? (since we cannot pass GFP flags to vzalloc()...)

Note that this is called with GFP_NOIO set for the caller context in the
case of revalidate zones, and default to GFP_KERNEL for
blkdev_report_zones() unless the caller also tweaks the context memalloc
flags.

> 
> Thanks,
> 
> Bart.
> 


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

