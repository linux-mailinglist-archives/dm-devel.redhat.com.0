Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C01581DC80D
	for <lists+dm-devel@lfdr.de>; Thu, 21 May 2020 09:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590047824;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UtlvJ00rRg+rQyyQ9E6ajzUkFMzYrEKXyPAHjZeR8Q8=;
	b=dGS2yi2axKx862lWe4pO4PDhGLywTAIuySDeGVnM6ASL0RrMeFBngTU86f8SrPYGVVlShR
	mMXryld0HPBfuTFftxxCzmXS+yxgo3RJvJ611Mc48H/W1YfQhFBAJgecSMUDISVfihyQ7V
	U5LFunCgdbgyv3Dxz3dRr+tvVcW631U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-CQ_ST37COpKAtp8fPjylHA-1; Thu, 21 May 2020 03:57:02 -0400
X-MC-Unique: CQ_ST37COpKAtp8fPjylHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9073619200C5;
	Thu, 21 May 2020 07:56:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36B3B1057FD9;
	Thu, 21 May 2020 07:56:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D8F11809543;
	Thu, 21 May 2020 07:56:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04L7uPdv008390 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 May 2020 03:56:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F89E202696B; Thu, 21 May 2020 07:56:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A9252026D69
	for <dm-devel@redhat.com>; Thu, 21 May 2020 07:56:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F49B801009
	for <dm-devel@redhat.com>; Thu, 21 May 2020 07:56:23 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-307-JzyxHIKMM3i_UdVrdRRxzQ-1; Thu, 21 May 2020 03:56:18 -0400
X-MC-Unique: JzyxHIKMM3i_UdVrdRRxzQ-1
IronPort-SDR: G3X4Z+G0tyqVw+HgIQoJQkyg+78PPjonZEjqhRyHoI2q5N6dD9gwxxS/fuSE0xWufgHsGY7bs3
	kmzs1z+0HxXxouicpNFQPo9FhUNqQX8zHsbFsrRAXtMndtLc+eVNy/tse5inYa4NkqUEfd/tRD
	gcuGDeqqQOKJnQQQOEIrwngE4UcAt3ce3TgzsZBvjrEvDZj1/WUMEiM81yrdygrx83iC338BHp
	yjNu7BQGEK+wFDW+8SazHzimdPuE98l0ClG8pRZ6BvPz/O9EJTBygthAT+AQkNOzcxxI3c8RbB
	6Bw=
X-IronPort-AV: E=Sophos;i="5.73,417,1583164800"; d="scan'208";a="240950647"
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
	by ob1.hgst.iphmx.com with ESMTP; 21 May 2020 15:56:35 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6722.namprd04.prod.outlook.com (2603:10b6:a03:221::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24;
	Thu, 21 May 2020 07:56:07 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Thu, 21 May 2020 07:56:07 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCHv2 0/6] dm-zoned: improve cache performance
Thread-Index: AQHWLbWOzQqixi2sakCOoPQRQ3e8qw==
Date: Thu, 21 May 2020 07:56:07 +0000
Message-ID: <BY5PR04MB690065822588EF8B23C63356E7B70@BY5PR04MB6900.namprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 35f45be1-ece9-44fd-f573-08d7fd5c6b71
x-ms-traffictypediagnostic: BY5PR04MB6722:
x-microsoft-antispam-prvs: <BY5PR04MB67228C05DB046A76199DEB94E7B70@BY5PR04MB6722.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 041032FF37
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: reQCFvAsfso1PdNFqIpdLCNOwdW3DE72of5gq6PdUnStYOGosONk76g5QDEKj8RvMpGniPMK3ctl0yV7OxSTBx8fjMPhgbj2/6xD5h5nE37B1ExAnoCmI3gk96zGOz8Dppet3gy5T/P2THJ/Pw+dwp6m1qZpRSSPFYl9disuHSv8s9RIS5DDfCYesQbFgCYZHQPhV062FZMSazwSVqiQtviyFgLEgr9kDQMci8/5ZgmHSlehSEoU8n5J9j7ZMKhKcy0G6ebSFQG3GUiwGmf00969zvTTBrN+iErXTu6MvGmhdMrsRrT4fFHa6WyIQwOUPlBmUBdiv9johqq0z1qRNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(8936002)(86362001)(316002)(54906003)(8676002)(33656002)(7696005)(186003)(6506007)(26005)(53546011)(5660300002)(71200400001)(6916009)(52536014)(4326008)(76116006)(64756008)(66476007)(9686003)(478600001)(66946007)(66556008)(2906002)(55016002)(66446008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 20ccWpO7jwCTg7rtI+9CFGmwUVWArYFoQYjKZNBpPdhnxyIHmENd7OnTG+2EWGBZNmwPU0b1gfgMWKLPNbW9qEtQ5w1bqfG8STAX2uMHsn8XSx7k76F4iTJZvL8sweHWsTlLLH/tivAxcGlJkj96WB4rT9Ht1vxE3A6kclyz4CqKmst86YJ6KlsKbWtgQVNZGgjEX4RJHM9uoU8vH3ApqVwq6XmTmfhv1mkzSuaEn0wxv8yn7/JwxZoExcMV2o58rH5+QBnBsFHVcvlls4Wb6ou93ZSZZffc7zsyD0hE1kHnlRjbXR1NRwh2mkk94FfbMQdrBu8ixnvHQye2BfACfjCY6qTb+ikPdG4sjQeAIKbKHVaGUm2hFrZFOlyCuGtRUL6l/FAtBYsHtYzhTHocsFsZRuzUcBzY9nBhUDMLCU9fPfvXZE7eZS4X7XD+JvDWHjh7WOCCpgPDC5Rq7LUH3Ik9b371Lpbl+SWXHtgt9sVWrmqUE3ekCy6NtdrOeRaQ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f45be1-ece9-44fd-f573-08d7fd5c6b71
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2020 07:56:07.5572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cssgqPP8OFfyqCtL5fmbcTUwLwZEUo9wtrioUOsVkHLwmYAdOlOlDi698oO3WCXQGecwM6tk5NSi/35qJAM4/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6722
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04L7uPdv008390
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

Mike,

Checked again: no problems detected with backward compatibility for single drive
V1 formatted disks. And as I already signaled, I tested both single and dual
drive setups with V2 metadata. Everything is good for me, not seeing any
problem/regression.

Thanks !

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

