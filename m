Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 791D61DC34F
	for <lists+dm-devel@lfdr.de>; Thu, 21 May 2020 02:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590019202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eEdCFfGfByCSivLVuQJ8jamdjWRchjjVnLfKvTXo2GE=;
	b=f5dfn1X9rcBX/dzIOfxElvao+7nb23d7Dsur5z1Myu1LW2dlmDOKTPuvAcNCdFmgX7TleQ
	F6l0c8O8dgynO+lz6wxtllsZDJuwpdfCRVNSFkoOlUmklXlUidSr9DvgB2mSaHmsZTOw1c
	F1cPjs+n/fdqWYv5yrajd07Z2N7Jrbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-i0lGTtdZP_yxsOOySmiB7g-1; Wed, 20 May 2020 19:59:58 -0400
X-MC-Unique: i0lGTtdZP_yxsOOySmiB7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 018FD1800D42;
	Wed, 20 May 2020 23:59:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8DC71081302;
	Wed, 20 May 2020 23:59:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3D1C1809543;
	Wed, 20 May 2020 23:59:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KNxTUx012802 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 19:59:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62993D017A; Wed, 20 May 2020 23:59:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55D44D1BD6
	for <dm-devel@redhat.com>; Wed, 20 May 2020 23:59:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB5F78ECB08
	for <dm-devel@redhat.com>; Wed, 20 May 2020 23:59:26 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-283-Qi-j4BDaOQ6RXwdsXJv2lw-1; Wed, 20 May 2020 19:59:24 -0400
X-MC-Unique: Qi-j4BDaOQ6RXwdsXJv2lw-1
IronPort-SDR: 1XC5ix0pRwUVoAunOQ4IgIk8IBc2cOapfXPKupD1rUQeOYsSYktDr7kIR5VJdieUiPZT0GMhJH
	Vtr5K61p6wbUEDAyZesibAqNabGj9W4exZceOdA2XbnC07+jJGAB8ryuyF3Xmv0n0UzvxFFNEc
	Qo9GbrtrbGpO0qp+sXw8EVIkRm7wxFSfjp3dwohR/uiwP1eDI466WZsxZKEHBdEJsbIJ3TbFUi
	XUaYFRC5jF6pP6xvfpoZU4Y71zCtG1JiKrvce6GvAOmb+wpY7atZVcc1AdyqvUYyLBQYbo+QkU
	3Is=
X-IronPort-AV: E=Sophos;i="5.73,415,1583164800"; d="scan'208";a="138494452"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
	by ob1.hgst.iphmx.com with ESMTP; 21 May 2020 07:59:23 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6310.namprd04.prod.outlook.com (2603:10b6:a03:1ed::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23;
	Wed, 20 May 2020 23:59:22 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Wed, 20 May 2020 23:59:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCHv2 0/6] dm-zoned: improve cache performance
Thread-Index: AQHWLbWOzQqixi2sakCOoPQRQ3e8qw==
Date: Wed, 20 May 2020 23:59:22 +0000
Message-ID: <BY5PR04MB69005CEAD9EC02ABFE2943C2E7B60@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200519081424.103318-1-hare@suse.de>
	<BY5PR04MB6900CC6DA3FECFAC70AFDC26E7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
	<20200520185334.GA4926@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7d434e06-f4ce-43c8-9acd-08d7fd19d12f
x-ms-traffictypediagnostic: BY5PR04MB6310:
x-microsoft-antispam-prvs: <BY5PR04MB631007700623780D4EADA7C4E7B60@BY5PR04MB6310.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZuRxofvcDwwaqAKEpBkmNu4VFl8MIAEt4igFYl3L+Q0h4ZSifa/Iuah2EMYjBwQ87iAub/NlF3iRvZjfTq9UWTqv8WLYBA+4l9vg/d2Cz9PhFeidcPPVg0OyOTbe8INhqY1DyTLgJ7aED7EyBLgzKUL3zYutdFK6+W6eeA/3qxNgv5ECCNprBpUlKa+U05Fz+5kJxvO9ljcc9IIr9HWgAbygPuh30zmOeiBRPiQnzp5pqRjPdeptOjaCfYQ2I2uE932PIcGMiE8i8XjjJqlcg+5wo3UThR4rn9jH92d7FUgDycJgFLas+zbU8Xhpf9r3Txn8bqkpNY4sPeLOrP64yw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(4326008)(76116006)(52536014)(66446008)(64756008)(66556008)(54906003)(66946007)(66476007)(2906002)(6506007)(53546011)(86362001)(26005)(5660300002)(7696005)(316002)(186003)(71200400001)(55016002)(8676002)(9686003)(6916009)(8936002)(478600001)(33656002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: Y8p/y+Yh7TcH901ACaJ8I2pEBusX1GC0y23npVL2JD5Kn9tCCR+tccNP2hABz89IfUwCP//aqViD+3MdmfE0IpLb+NAV6dhhSw5jEGw7KDeddKfslRByW/9m8ohG1u9jTO3B57/vbcB5zQsRnotdshXHn5/K/yE7feLqv7mmlQSVyGTBKssX6EP1bwoYrpHMc8wql31S/0cCUbAwKvO+aHRvkqSUsKXvh51Jbgy5w7sYV5+VM/VxqE9prsQvRXJQx4uyjEGWGWF6KXkZzMPshfPQG+iWoLQCNvUcY91uA/Q1d9PQkycNU+tvqJ+eM+ZfTL3uEEd+yEXhf4kdjs7m4Jtq407BW0SWhPGhvn4qb32LNqbwB6czGMDTB5+oF4QuORVdQJ5INQjb/YuW1NCQNp5DtO3y/XDcWegpTVYvbevbM4MGyNuhE02F91ex/NQ2qkx/x9A9R9Kb4iFodqA6H3KegSeC3NES0NhH0Yz2pxju6GCY0rhktuJA/vkrrF/I
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d434e06-f4ce-43c8-9acd-08d7fd19d12f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 23:59:22.0766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7sk5dDA+jTuRQspGVjyDX8VjiaHZeElixPKa/WMhypeTe/cEGJpxlBOJ7Z2wHMbm8iUF89wPR2OkgL35o5Dbnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6310
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04KNxTUx012802
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv2 0/6] dm-zoned: improve cache performance
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/21 3:53, Mike Snitzer wrote:
> On Tue, May 19 2020 at  6:36pm -0400,
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>> On 2020/05/19 17:14, Hannes Reinecke wrote:
>>> Hi all,
>>>
>>> here's an update to dm-zoned to separate out cache zones.
>>> In the update to metadata version 2 the regular drive was split
>>> in emulated zones, which were handled just like 'normal' random
>>> write zones.
>>> This causes a performance drop once these emulated zones have
>>> been mapped, as typicall the random zones from the zoned drive
>>> will perform noticeably slower than those from the regular drive.
>>> (After all, that was kinda the idea of using a regular disk in
>>> the first place ...)
>>>
>>> So in this patchset I've introduced a separate 'cache' zone type,
>>> allowing us to differentiate between emulated and real zones.
>>> With that we can switch the allocation mode to use only cache
>>> zones, and use random zones similar to sequential write zones.
>>> That avoids the performance issue noted above.
>>>
>>> I've also found that the sequential write zones perform noticeably
>>> better on writes (which is all we're caching anyway), so I've
>>> added another patch switching the allocation routine from preferring
>>> sequential write zones for reclaim.
>>>
>>> This patchset also contains some minor fixes like remving an unused
>>> variable etc.
>>>
>>> As usual, comments and reviews are welcome.
>>
>> I ran this overnight with no problems. Throughput results attached.
>> Reclaim seems to be a little too aggressive as it triggers very early. But we
>> can tune that later if really needed: the combination of ext4 writing all over
>> the place and the faster cache zones on SSD may simply result in a percentage of
>> free cache zones becoming low very quickly, in which case, reclaim is working
>> exactly as expected :)
> 
> I've staged this series for 5.8 in linux-next
> 
> Just to make sure no regressions due to all the metadata2 changes: Did
> you happen to verify all worked as expected without using an extra
> drive?

Yes, I did.  Single and dual drive both work fine with v2 metadata.
I will retest the case of a V1 format using V2 code to be extra sure.

> 
>> Mike,
>>
>> With the NVMe io_opt fix patch applied, the alignment warning for the target
>> limits is gone.
> 
> OK
> 
> Thanks,
> Mike
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

