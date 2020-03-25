Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA711923CC
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 10:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585127605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DDdCZr0NE3HpmbCxEq6Z12JmPa4VJoQS9bxQAmQjkd4=;
	b=diPqVGy/4hk9zr4fonWxbkXuMILQeidJOCuqX+x5T4PvxXrDZRhgvLEIDaIbAT2wjl6g2I
	I7c94eg9q405pCTSMaDkPjWOkxJnPQlZUJMyFOz1tdb1LaUyiExlKFjAwthmaAt7mA00Cg
	ohJzk0ygrN99EqJNBfhQfZOvg2TSjBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-Arly0ESZNNOob4Lex9VrkQ-1; Wed, 25 Mar 2020 05:13:21 -0400
X-MC-Unique: Arly0ESZNNOob4Lex9VrkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0AFF1937FEA;
	Wed, 25 Mar 2020 09:13:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6F3893265;
	Wed, 25 Mar 2020 09:13:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09B0386382;
	Wed, 25 Mar 2020 09:12:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P9AmF4030129 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 05:10:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0683C2037E45; Wed, 25 Mar 2020 09:10:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 008682037E43
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 09:10:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F04A185A78E
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 09:10:46 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-348-YBGWsTYvMYS-AmQk-71rxw-1; Wed, 25 Mar 2020 05:10:43 -0400
X-MC-Unique: YBGWsTYvMYS-AmQk-71rxw-1
IronPort-SDR: L6B2BSh854wquZc7piI2MGjXSI8UnB1LpeKS3LR5WhiatfOdstIsDdH9UlijS+ayYLnHix8LwK
	sK2OPwpuopEzbmR20oKpbJOWTf5y5AcRs5VvLtVImvVf8xQNLJL23U6NtfiaSRgNMbpm7pKrbX
	18fMGXugh2Zr+5wMc/4K24lE5b6MaNtvuMk0/oIB0xAX/GBEWBvOY712OHxUVsF3Fp1CiS46xl
	9H2XN2+N8awTF9TfzfDBvmwrLItzte2SKNOPUQrNW+OH16QAO0xG830/TGACuueG+oFuavYTZq
	UyI=
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="133453149"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
	by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 17:10:41 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2198.namprd04.prod.outlook.com (2603:10b6:102:7::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Wed, 25 Mar 2020 09:10:41 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.023;
	Wed, 25 Mar 2020 09:10:41 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Bob Liu <bob.liu@oracle.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH v2 3/3] dm zoned: add regular device info to metadata
Thread-Index: AQHWAcvtLt+lRR39/UysINFCEirB8Q==
Date: Wed, 25 Mar 2020 09:10:41 +0000
Message-ID: <CO2PR04MB23433CAD26D492654041FCDCE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-4-bob.liu@oracle.com>
	<CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<812da9e9-cfd2-ea24-60cb-4af48f476079@suse.de>
	<CO2PR04MB23439B5FA88275A80D3449DFE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<0bd2daa1-abbf-681d-405c-f7e4aecd577c@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: da12d0e0-8ff4-4db5-4185-08d7d09c643b
x-ms-traffictypediagnostic: CO2PR04MB2198:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR04MB21982A029A3962B86C41D75AE7CE0@CO2PR04MB2198.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(478600001)(71200400001)(2906002)(8936002)(9686003)(76116006)(81156014)(64756008)(8676002)(91956017)(33656002)(81166006)(86362001)(66946007)(66476007)(66556008)(66446008)(4326008)(52536014)(53546011)(6506007)(5660300002)(55016002)(26005)(54906003)(7696005)(186003)(316002)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2198;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +4b6+y+huNAbN7YunWzcttYFAe7l7DnmLAhJPAhWMEC5O0rRP2lLhXXXZwfW/yc8Uv5p21WMiVACQOB6RMpmFWYkQ/CBSQ+qX59FGczl2KRuPx2eDJ6aIGQmmMzqfBN5tKl477Hc/oMCqqZB8E7f/fk/zhbgWemkBYSPLgxmftLh9J2P1j6Za+Fhl8tYEPlwP5dH/AV7l9X7ZaRY/5z+YY4QVyECGEb6moD0jDvfMNT5kgUlPf+aOpx0AvoKNiV/6mnZg4l81JssP2E+zF+dNnNTYWmt3+KVpQyg/yB/c13gDKIqJN6UqwcwDeHSgSLB+hGoEQoIMO29LBkIRWGlygO4KydcICaq06VfA4saDmfKofpHyH7w6qvtetbegEzUxJxBh00yEftZHyZp9RdoNYQ4DbSAg69g/OXch/ZJRNRAaJIWxwc4Pc165byDZrs+
x-ms-exchange-antispam-messagedata: qZB0qV59xrLe72x2CmtOfn8/saHy2zKteQVaZV2p2lLHdlCJXU7jzwXMUpPlznJa5kKzv2r4FIK5DFulHVQ15XW1cEBqQwulvjxSbx/oNKEF6OW5JywxKL92rj5taFu7KF62KMIjtUAqzdfsEfBBJg==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da12d0e0-8ff4-4db5-4185-08d7d09c643b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 09:10:41.0265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2GCU+GSDueMJnGJiKMYXTSJZfVt/goqjcPHqpdIuh0t+zM0iKpMy8yyFzw4vAuL+32PB5ni1cIw4jPq+bul3JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2198
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P9AmF4030129
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Fomichev <Dmitry.Fomichev@wdc.com>, Dmitry
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] dm zoned: add regular device info
	to metadata
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

On 2020/03/25 17:52, Hannes Reinecke wrote:
> On 3/25/20 9:02 AM, Damien Le Moal wrote:
>> On 2020/03/25 15:47, Hannes Reinecke wrote:
>>> On 3/25/20 7:29 AM, Damien Le Moal wrote:
>>>> On 2020/03/24 20:04, Bob Liu wrote:
>>>>> This patch implemented metadata support for regular device by:
>>>>>    - Emulated zone information for regular device.
>>>>>    - Store metadata at the beginning of regular device.
>>>>>
>>>>>        | --- zoned device --- | -- regular device ||
>>>>>        ^                      ^
>>>>>        |                      |Metadata
>>>>> zone 0
>>>>>
>>>>> Signed-off-by: Bob Liu <bob.liu@oracle.com>
>>>>> ---
>>>>>    drivers/md/dm-zoned-metadata.c | 135 +++++++++++++++++++++++++++++++----------
>>>>>    drivers/md/dm-zoned-target.c   |   6 +-
>>>>>    drivers/md/dm-zoned.h          |   3 +-
>>>>>    3 files changed, 108 insertions(+), 36 deletions(-)
>>>>>
>>> Having thought about it some more, I think we cannot continue with this
>>> 'simple' approach.
>>> The immediate problem is that we lie about the disk size; clearly the
>>> metadata cannot be used for regular data, yet we expose a target device
>>> with the full size of the underlying device.
>>> Making me wonder if anybody ever tested a disk-full scenario...
>>
>> Current dm-zoned does not do that... What is exposed as target capacity is
>> number of chunks * zone size, with the number of chunks being number of zones
>> minus metadata zones minus number of zones reserved for reclaim. And I did test
>> disk full scenario (when performance goes to the trash bin because reclaim
>> struggles...)
>>
> Thing is, the second number for the dmsetup target line is _supposed_ to 
> be the target size.
> Which clearly is wrong here.
> I must admit I'm not sure what device-mapper will do with a target 
> definition which is larger than the resulting target device ...
> Mike should know, but it's definitely awkward.

AHh. OK. Never thought of it like this, especially considering the fact that the
table entry is checked to see if the entire drive is given. So instead of the
target size, I was in fact using the size parameter of dmsetup as the size to
use on the backend, which for dm-zoned must be the device capacity...

Not sure if we can fix that now ? Especially considering that the number of
reserved seq zones for reclaim is not constant but a dmzadm format option. So
the average user would have to know exactly the useable size to dmsetup the
target. Akward too, or rather, not super easy to use. I wonder how dm-thin or
other targets with metadata handle this ? Do they format themselves
automatically on dmsetup using the size specified ?

> 
> Cheers,
> 
> Hannes
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

