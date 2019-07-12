Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C300D67690
	for <lists+dm-devel@lfdr.de>; Sat, 13 Jul 2019 00:34:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3091DC058CBA;
	Fri, 12 Jul 2019 22:34:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDD1F6012C;
	Fri, 12 Jul 2019 22:34:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42F5F41F53;
	Fri, 12 Jul 2019 22:34:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CMY97L022670 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 18:34:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE7EB6013B; Fri, 12 Jul 2019 22:34:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7E8F6012C;
	Fri, 12 Jul 2019 22:34:05 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CECAD30C132E;
	Fri, 12 Jul 2019 22:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1562970833; x=1594506833;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=cZaO/huk/mrw/uSTRcu2vwWDIqZDPc37x7B9FiZrYLQ=;
	b=BbCwkgA3pbI+eDxfHvS2GCh0axsk09yhUpdcbp4m1CuiO+naZ3I/Lfi4
	JV8FTs5KC1RuCj8BT7etwH1V5tHWjXzepcrGRJ0opoJ5DmyHK9LLNQbfM
	eLVchaSZF/mn7O/ULVtV0JfafpCItZA/dEM2nxsbuDZ5Yr7SsCvskxZbW
	VtTWrrC0wrX2HUWq6mG7Idz+7n/mpNfDVq0oC/pJPLoPgc4qd/Esl4atY
	oyVZOrbUkfpB3wCNJ7K8cHLCiv8fBdrpFKnaWPLe50X6drF12yjBSGMPn
	VRrH7fSM6lKbvip31fgKyY+rOHUrxbMcDzeN9oWxznHBDzzIifwmjch7Y Q==;
IronPort-SDR: tsCGHpEouwsmmlpp7mWElGzBqwSww5j+aXmyV0YCw4vAzSJ48g8kykjk4d3lWDu6R2c09hiCbv
	vmSHuD/ce+c2fwwf+vcSpMqTWSHbJceVdGJEOB3o0+sicBHiOK88lLRHV/cvk7XYzlI2OO/0ru
	GtZIxPDIgBRla4NPqPDRR+48vRVsSeqXcr8rA9a4We3sqdqyQoJa2YT4byu1IlxztivrGm48rR
	lLV3TDbEYDf0flr+3vt5HpkusWv4tQBVoDAEbcaHcDSXdQ2JNuXdy138SYDTWFTj8rUcygMntj
	7VY=
X-IronPort-AV: E=Sophos;i="5.63,484,1557158400"; d="scan'208";a="219352955"
Received: from mail-co1nam03lp2052.outbound.protection.outlook.com (HELO
	NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.52])
	by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2019 06:33:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cZaO/huk/mrw/uSTRcu2vwWDIqZDPc37x7B9FiZrYLQ=;
	b=YhQ6lFbJMmz5ypx07Ge8/13MGly/KxPvMLSs1eVlshFAE3sMxFuYvbEFq+ew7ZTIRn5oTIC1fSlC2B8AAWjSH7BHj7LlsF2HBUzQXRizcAVVXVUYWcGaenfjTO4uqZjmEPFGKlu22s9kCS63MLwMYPT4tNMnCiT+TKmEEJC3IdE=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB4696.namprd04.prod.outlook.com (52.135.240.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.19; Fri, 12 Jul 2019 22:33:22 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2073.012;
	Fri, 12 Jul 2019 22:33:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "Martin K . Petersen"
	<martin.petersen@oracle.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH V6 0/4] Fix zone revalidation memory allocation failures
Thread-Index: AQHVL8ssJYyertgVkky0I6r2FZ0yYw==
Date: Fri, 12 Jul 2019 22:33:21 +0000
Message-ID: <BYAPR04MB5816F76F09488AE706B49F72E7F20@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
	<BYAPR04MB5816BC7EC358F5785AEE1EA9E7F60@BYAPR04MB5816.namprd04.prod.outlook.com>
	<cb26f686-ce7e-9d1a-4735-2375d65c0ea5@kernel.dk>
	<27386e10-7494-7fcf-f203-484db5c3c69c@kernel.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5d904e4-7c9b-440a-2390-08d70718f247
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4696; 
x-ms-traffictypediagnostic: BYAPR04MB4696:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR04MB469631F5CF470FB512E24703E7F20@BYAPR04MB4696.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(199004)(189003)(66066001)(486006)(2201001)(74316002)(91956017)(86362001)(186003)(8936002)(81156014)(33656002)(305945005)(7736002)(53546011)(102836004)(5660300002)(14454004)(6506007)(446003)(71200400001)(81166006)(8676002)(26005)(110136005)(71190400001)(54906003)(99286004)(4326008)(476003)(76176011)(64756008)(7416002)(2501003)(9686003)(55016002)(6246003)(6306002)(316002)(66946007)(52536014)(3846002)(66476007)(68736007)(2906002)(7696005)(478600001)(14444005)(256004)(229853002)(6436002)(25786009)(966005)(53936002)(66446008)(4744005)(6116002)(66556008)(76116006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4696;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oBv38V8vuDEVIIvHi+SwYfH2AiuG1gqVdZ56z9hL5fPr87EqSm+NQ7nfb3qvWmAMXF+sWavPmqbIQIFDm0R9WGOAS4ONoDM+oXFIdAN1rvRzOlmzvKb4hHdoVr5/Dj0sBNG52EgOtLkf7xKpDZZfha2DFW2wwuIQ+yqybopbHwqV7+S/QO7mUn8bnIuwci0mzM16FGgqMI3JF08BLz6gzEgjlDlTk2kqcPXLI29Bl1YQRUulUlQcHww5C8hk+MWiVj0MPrWfmVmEpjZxVsrz7yW/hFY/4ONRMb0Z3P8I4ijNthH6drQ3hgQI2xnxyrxdQhWikL8ZqPlQigHop8XWLT1z6pLq9C4wvLbpFTs+DzqqGclY4hwXufhsuupdx2xYIP0yoyytHwiaCceVnQayQllzadFMFwHZ74azL7tzqeU=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d904e4-7c9b-440a-2390-08d70718f247
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 22:33:21.9173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4696
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Fri, 12 Jul 2019 22:33:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 12 Jul 2019 22:33:53 +0000 (UTC) for IP:'68.232.141.245'
	DOMAIN:'esa1.hgst.iphmx.com' HELO:'esa1.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.141.245 esa1.hgst.iphmx.com
	68.232.141.245 esa1.hgst.iphmx.com
	<prvs=0899dbd4f=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6CMY97L022670
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH V6 0/4] Fix zone revalidation memory
	allocation failures
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 12 Jul 2019 22:34:53 +0000 (UTC)

On 2019/07/13 0:13, Jens Axboe wrote:
> On 7/11/19 8:05 PM, Jens Axboe wrote:
>> On 7/7/19 8:02 PM, Damien Le Moal wrote:
>>> On 2019/07/01 14:09, Damien Le Moal wrote:
>>>> This series addresses a recuring problem with zone revalidation
>>>> failures observed during extensive testing with memory constrained
>>>> system and device hot-plugging.
>>>
>>> Jens, Martin,
>>>
>>> Any comment regarding this series ?
>>
>> LGTM, I'll queue it up for this release.
> 
> This broke !CONFIG_BLK_DEV_ZONED builds for null_blk, btw. Please be
> sure to test with zoned enabled and disabled in your builds when
> changing things that affect both.

I always check the !CONFIG_BLK_DEV_ZONED case. But clearly I made a mistake
somewhere on this one and missed the problem. My apologies for that.

> 
> I fixed it up:
> 
> http://git.kernel.dk/cgit/linux-block/commit/?h=for-linus&id=e347946439ed70e3af0d0c330b36d5648e71727b

Thank you for this.


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
