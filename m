Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 63E0024F336
	for <lists+dm-devel@lfdr.de>; Mon, 24 Aug 2020 09:40:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-Ed25sjGzOseVuP0XxEqwsg-1; Mon, 24 Aug 2020 03:40:29 -0400
X-MC-Unique: Ed25sjGzOseVuP0XxEqwsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C096F1DDE9;
	Mon, 24 Aug 2020 07:40:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 983A460CD1;
	Mon, 24 Aug 2020 07:40:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BE50181A06C;
	Mon, 24 Aug 2020 07:40:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07O7eJh6028767 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 03:40:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D5A2200BCF0; Mon, 24 Aug 2020 07:40:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47CFF2026F94
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 07:40:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C4C91815DC4
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 07:40:17 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-381-aIwrJ85RN_u3hrrqA7S8Gw-1; Mon, 24 Aug 2020 03:40:14 -0400
X-MC-Unique: aIwrJ85RN_u3hrrqA7S8Gw-1
IronPort-SDR: st1mETHpemTdwheFKVqVw4KpjcpXcmRuvdxSGPM8QSf+Z3H7Vg9D63BXId9jJcTcbfIgITgbtP
	iEAWCvanfXYc4XDrKj70ez8exb0Es1PFrYPjxTsMWynxPFxEXgPNEFZjXcLoZAdLqrwi+s2Qpd
	oaks+IQQwPdup07arm2YGNxMry18zDbdjFqLea8AqDwpj4tqd86Lj12l+vCiSrelN6q966hOsX
	I0ra9wc06UwNl1nzjXGJx0I4HOFm7VtJul2woK09W075i6dPJzbT276ENH3+m93c9JZSke/x5O
	BBE=
X-IronPort-AV: E=Sophos;i="5.76,347,1592841600"; d="scan'208";a="146885321"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
	by ob1.hgst.iphmx.com with ESMTP; 24 Aug 2020 15:40:14 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0729.namprd04.prod.outlook.com (2603:10b6:903:e2::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24;
	Mon, 24 Aug 2020 07:40:11 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::7d15:9936:4b3b:f8a2]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::7d15:9936:4b3b:f8a2%12]) with mapi id 15.20.3305.026;
	Mon, 24 Aug 2020 07:40:11 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Milan Broz <gmazyland@gmail.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>
Thread-Topic: [PATCH] dm-crypt: Document new no_workqueue flags.
Thread-Index: AQHWeeJMnjveZeKDRU6plWNRsOO8mw==
Date: Mon, 24 Aug 2020 07:40:10 +0000
Message-ID: <CY4PR04MB3751E799136C15AEB32BBEF0E7560@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200820174538.20837-1-gmazyland@gmail.com>
	<CY4PR04MB37518F3475AE21AB020B628DE7560@CY4PR04MB3751.namprd04.prod.outlook.com>
	<5e803f19-241a-d2ff-6cdb-a45846cd06a0@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1613c9e7-bc58-456f-efa7-08d84800ee6d
x-ms-traffictypediagnostic: CY4PR04MB0729:
x-microsoft-antispam-prvs: <CY4PR04MB072937E08FE20302876A47C2E7560@CY4PR04MB0729.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7HabLGVkyUcUnW4gF1w+eu15i+gIo4iwfMxeOlw2hZ0WD4j+CgMB0WqOJsnNqv89F4HOq+oVCln6bxYzV1aBVSaRjlctgp4QsEoEjZYqtQ+rFKs2t/5NztqTHKMgkCB/p1ZlURiWmNl5Hnp+SXSnwtrk6VCGLpeUrtJc7BxFI9lnKZVHTIoeQo5gy8Be75Hi8H7sgmHtVscmJThiM7Q36ziqkzHYwP7fRc1WUVgrL/+RU7uzSfgmEoFDBa+8cv7jlzpy9YF+5o0bc82FJ9agME/w1uvv5E8PvhxCTHCQzGhuMlGhZ3z5zQFN2ew5aVyGwQmfCPl0JJrJQEane1a+2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(66446008)(91956017)(33656002)(76116006)(66476007)(64756008)(66556008)(316002)(71200400001)(2906002)(8936002)(66946007)(478600001)(5660300002)(55016002)(83380400001)(26005)(110136005)(7696005)(52536014)(9686003)(8676002)(86362001)(53546011)(186003)(6506007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: A3MNzEMOSklL8Zk8hkPfsVH4qnP0ZqBPvSbxVHqmA2TmicGRN0iaRoCfTHjziaRzsJ7WjF1wX0SypboNutj8Vws0TtmD0gB0KjnvMcbrUDUUTPLp1FftuM5EjERZ00yNUzFpGdh3cnf54DP+G/WVs0Q+eUqbaHRSsAcOBtWtHJA3F1QjTqKHp0bi5P3vSs/DJ8AFP0WQE4huc5IDPfMwdcC1NG/omw+sj7rFUBU8mgtLseVId7wCNu9grpIrYuchgqQ+b9UiGb7rSnafY3oCy+JaSAGE8LDPM+q/STmrcdebRdUyNYqMZSbCkAweJFekGDMPQRvSMs4i5WRgw1DZMsP1SXIP7a1TnU5G7I1oib92WXyNSDq4QGhy1cYXLjY/2Em5TysMIsMwlfvj9TsiLD7gtvVibllAeqLmwGjG5Afu0gCcCUdoHxaZpq/OLZbY/Ji6r47Uc7YQWcdti2DBY1o/u0k8yEQz3gQ+lXpJYxHaI6yaPuSJn7qwQEEDuf9FS1Jo+y9493lGYEs17MRztUQdhWwYB5mBFxTKlZELdCOM5nlMv+eytAhPAp6UiYLkT36C1Y/qkadvoVM8jChlIRLjx2EZkG5O5nHs0WJwYq3ktUGSN23Cp5+9Vm84VRXzggyGKhLr3ZOYREyC+X6kPQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1613c9e7-bc58-456f-efa7-08d84800ee6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 07:40:10.9447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzZvyoHaommqx2T0DtTshTO4L7a1KC9UvqHW0iOsYQC82nsYckk7H3lyp7Gq8Eje6nwNASDjhNEbD65CBVgKvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0729
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07O7eJh6028767
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-crypt: Document new no_workqueue flags.
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/08/24 15:46, Milan Broz wrote:
> On 24/08/2020 03:15, Damien Le Moal wrote:
>> On 2020/08/21 2:46, Milan Broz wrote:
>>> Patch 39d42fa96ba1b7d2544db3f8ed5da8fb0d5cb877 introduced new dm-crypt
>>> no_read_workqueue and no_write_workqueue flags.
>>> 
>>> This patch adds documentation to admin guide for them.
>>> 
>>> Signed-off-by: Milan Broz <gmazyland@gmail.com> --- 
>>> Documentation/admin-guide/device-mapper/dm-crypt.rst | 6 ++++++ 1 file
>>> changed, 6 insertions(+)
>>> 
>>> diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst
>>> b/Documentation/admin-guide/device-mapper/dm-crypt.rst index
>>> 8f4a3f889d43..94466921415d 100644 ---
>>> a/Documentation/admin-guide/device-mapper/dm-crypt.rst +++
>>> b/Documentation/admin-guide/device-mapper/dm-crypt.rst @@ -121,6 +121,12
>>> @@ submit_from_crypt_cpus thread because it benefits CFQ to have writes
>>> submitted using the same context.
>>> 
>>> +no_read_workqueue +    Bypass dm-crypt internal workqueue and process
>>> read requests synchronously. + +no_write_workqueue +    Bypass dm-crypt
>>> internal workqueue and process write requests synchronously.
>> 
>> Could you add one more line here saying something like:
>> 
>> This option is automatically enabled for host-managed zoned block devices
>> (e.g. host-managed SMR hard-disks).
> 
> Yes, Mike can squeeze it there (Mike, if you prefer, I can resend the patch
> with the note above).
> 
> I just see one problem here - when we activate device without these flags, 
> then dm-crypt decides to set the feature bits because of zone device.
> 
> So you activate device with some feature set but table will show something
> different. It is not a technical problem, but I think DM table was not
> expected to behave this way.

Hmmm. Never wondered about that... Mike ? Is this a big problem ?

> It is probably not the first change (I think some flags are activated in
> dm-integrity according to on-disk superblock state only).
> 
> Milan
> 
> p.s. Both noqueue flags are now supported in cryptsetup master, for LUKS2 we
> can store them persistently (IOW to be used in all later LUKS2 activations if
> kernel supports it). It should appear in next stable cryptsetup release.

Great. Thanks. Note that I have code for Luks format on host-managed SMR disks,
or rather any host-managed zoned block device, including ZNS NVMe SSDs.

The current cryptsetup code needs some massaging for these drives because:
1) offset+size needs to be zoned aligned, so at the very least defaulting to
--offset=<device zone size> is needed.
2) The on-disk formatting is annoyingly not writing sequentially :) So the
current code fails if the drive does not have a conventional zone at LBA 0.

My code is rather dirty for now and needs a good cleanup. I will do that
rebasing on the next stable that adds the no queue flags support. The current
cryptsetup does work as is with plain type, and with Luks type for SMR drives
that have a conventional zone at LBA 0 with the added --offset=<device zone
size> option specified.

Best regards.


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

