Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B44F91CDB1B
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 15:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589203461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qF2i/Qkhw1C3r1ubekuKnMFX5lqWgK4LU52/GLmXvQU=;
	b=TXGkzXte0GZSR9r1FtIxYrXGK4lEmo2tP1zNu2B1MM1aBotlre8BRA2b+u1q9UDO505GY+
	m2YHT9ErvmPhpXXk7M0Lv77H2uQCk6pt+gB5TOr0S0E7tamW2wwHTKuxbbv7svnsRX7cwv
	oxYq0tiDDOSluxR9+K03u8xv22fr3Pk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-TF8Lg6PuNeaLhFLCr18Zog-1; Mon, 11 May 2020 09:24:19 -0400
X-MC-Unique: TF8Lg6PuNeaLhFLCr18Zog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 327011B18BCC;
	Mon, 11 May 2020 13:24:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3081E1002394;
	Mon, 11 May 2020 13:24:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4932B1809543;
	Mon, 11 May 2020 13:23:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BDNm6D027555 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 09:23:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 001AD66071; Mon, 11 May 2020 13:23:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast03.extmail.prod.ext.phx2.redhat.com [10.5.110.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE2BA6606E
	for <dm-devel@redhat.com>; Mon, 11 May 2020 13:23:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 652E319200CC
	for <dm-devel@redhat.com>; Mon, 11 May 2020 13:23:42 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-3voHpj8RMbCbPgBFdcL0XA-1; Mon, 11 May 2020 09:23:37 -0400
X-MC-Unique: 3voHpj8RMbCbPgBFdcL0XA-1
IronPort-SDR: B8lX8C6vcAupXfD6NQib8RIQDCparhOdv81DKyW7/ptBi+ZT0dhS6RakbNoHokuuc3LK5+njoY
	Z04JyPl+SnbXyEoKN8zaRpaWbjipe3cFnv+t6hP70ArNPQ3F3uUaArSuOVbhUtmtRmVU1iaT6K
	Fb28frml4HE6HoKNLklHGSnsJS7dfTGRb2fXKDWuPnAr6kiA2fa8YnHdC0Y+iBzgcHIMa17POS
	9RYNLwyrUH7JmbWUervDRac09jrfvYHqzF1J26BRx9K7AXHLXcV331dschHny72mmHxRtrYIOU
	JdA=
X-IronPort-AV: E=Sophos;i="5.73,380,1583164800"; d="scan'208";a="138835167"
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2020 21:23:36 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6818.namprd04.prod.outlook.com (2603:10b6:a03:224::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26;
	Mon, 11 May 2020 13:23:34 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2979.033;
	Mon, 11 May 2020 13:23:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCHv5 00/14] dm-zoned: metadata version 2
Thread-Index: AQHWJRechFCM8ZarfEqHZb3tednc9w==
Date: Mon, 11 May 2020 13:23:34 +0000
Message-ID: <BY5PR04MB690020AE68E7A20EA8BFED0DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<2553e593-795d-6aed-f983-e990a283e2ff@suse.de>
	<BY5PR04MB6900C84D00585D3560D4C51AE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e91fe3d2-81c0-4d80-23cc-08d7f5ae81df
x-ms-traffictypediagnostic: BY5PR04MB6818:
x-microsoft-antispam-prvs: <BY5PR04MB6818006DB277629911CCEB57E7A10@BY5PR04MB6818.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:374;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SK9ad2baJcbT+v08Wxt+xWOesNNrfP29jOCsCmRp60QkEiUJv6p4UL2Y71PSfrvJDEfDAL/e0GLiS/z4F3qaEpqDctBKrPiF5OALOe1RijrBg2yBKo7TLqhC7ssjspH5j7Q2pCTYZaQ68SpBYXNsQ1NIFAVECP76UIUDwdaLf42CeiotCpMIARqpp3crlVtkJ9dhvbMtnVdWO9vyT4Q7t9uikAXcVv1SJoz5MBUcxbDXvNiDqUctzdveutU+VmwsvFmikKGCEyEr6QgnEOceMkkGtPLD9e1vmlcL++tI21MjRi7g1Zu69LeIEZuz66iK06mRoDOWx/gsj5GiKjgiVWbsJ5gi7IRzV7fAMs7+3hM+Bq6kZmYG/QQmU5A/LOcdhP+M+/LcbXRevkA8UCx0CuhsuGxIQDPIDSlQWP6+uGbVZ8C9GX1qSYBYKHQf/gDLxjA1fDmpJ0rwl+Ky0C+zmXzqcFGT8MMSLnWfwiDkGXBISsv3SrVsdpepOYdiPFg3xAabQyDZSxmd3VmWXtqVnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(33430700001)(66556008)(186003)(64756008)(66446008)(7696005)(86362001)(33440700001)(33656002)(76116006)(71200400001)(5660300002)(55016002)(9686003)(478600001)(2906002)(4326008)(52536014)(26005)(66476007)(66946007)(54906003)(6506007)(53546011)(316002)(110136005)(8676002)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: P3bFqSz7upnw8RHiVxwGJJFehDWDLskABr/t4g/laCSnngzS5uTCfjqa2yc3c3gyhu8tmk93AwdnPjGuQJIcbvr8XSx/7vuThFA9D6ERFCxA6pPrtLqua/XwzAo4ro5p3fzodgEGtojBd2xj6Vz+qrjpm+4CMJeC/whOVwZ855qFGqdp3oZ3SEhzwqf6eCzV7DVrbmklpH4X46XHAbxuDixQg4ZmtRC0qFuZ5LPYMw+61mQ2srx8S9VLLmwgEEezzsYPmoZNK82rsb74AkufQznqDgidbABekB6r131az4E0JWzKfuZKn1vsXN004/CZdP2XceAK8VvAn+waZ4Fuwnus/2BL20EUHPK22+l8xGWMRs3Fdo1mCJYL5tPpqW/HlhRDmGkshXQ6XdsL2zXKh60WwyX4RViTW/3dK7L4jLQM3FCYPtY1jsurSf4QYuNpYBNNjYJnC/1+InozpOV6RO2GrHmLTs7fHKGp58KgHSEp/hzcVJU0YmCwof+dNiya
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91fe3d2-81c0-4d80-23cc-08d7f5ae81df
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 13:23:34.6391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PyqFmnwPQ+qr9qcDwhX/NgqfpnEecj2pgf3UmVRAPxK7CQLfoE3O8rfTH0jny31DFPPUpHG2u+Ab/a2HO52DHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6818
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BDNm6D027555
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
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

On 2020/05/11 20:46, Damien Le Moal wrote:
> On 2020/05/11 20:25, Hannes Reinecke wrote:
>> On 5/11/20 12:55 PM, Damien Le Moal wrote:
>>> On 2020/05/11 11:46, Damien Le Moal wrote:
>>>> Mike,
>>>>
>>>> I am still seeing the warning:
>>>>
>>>> [ 1827.839756] device-mapper: table: 253:1: adding target device sdj caused an
>>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>>> alignment_offset=0, start=0
>>>> [ 1827.856738] device-mapper: table: 253:1: adding target device sdj caused an
>>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>>> alignment_offset=0, start=0
>>>> [ 1827.874031] device-mapper: table: 253:1: adding target device sdj caused an
>>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>>> alignment_offset=0, start=0
>>>> [ 1827.891086] device-mapper: table: 253:1: adding target device sdj caused an
>>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>>> alignment_offset=0, start=0
>>>>
>>>> when mixing 512B sector and 4KB sector devices. Investigating now.
>>>
>>>
>>> OK. Figured that one out: the 500GB SSD I am using for the regular device is
>>> 976773168 512B sectors capacity, that is, not a multiple of the 256MB zone size,
>>> and not even a multiple of 4K. This causes the creation of a 12MB runt zone of
>>> 24624 sectors, which is ignored. But the start sector of the second device in
>>> the dm-table remains 976773168, so not aligned on 4K. This causes
>>> bdev_stack_limits to return an error and the above messages to be printed.
>>>
>>> So I think we need to completely ignore the eventual "runt" zone of the regular
>>> device so that everything aligns correctly. This will need changes in both
>>> dmzadm and dm-zoned.
>>>
>>> Hannes, I can hack something on top of your series. Or can you resend with that
>>> fixed ?
>>>
>>>
>>>
>>>
>> Does this one help?
> 
> Nope. Same warning.
> 
>>
>> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
>> index ea43f6892ced..5daca82b5ec7 100644
>> --- a/drivers/md/dm-zoned-target.c
>> +++ b/drivers/md/dm-zoned-target.c
>> @@ -1041,13 +1041,17 @@ static int dmz_iterate_devices(struct dm_target *ti,
>>   {
>>          struct dmz_target *dmz = ti->private;
>>          unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
>> +       unsigned int nr_zones;
>>          sector_t capacity;
>>          int r;
>>
>> -       capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);
>> +       nr_zones = DIV_ROUND_DOWN(dmz->dev[0].capacity, zone_nr_sectors);
>> +       capacity = nr_zones * zone_nr_sectors;
> 
> 	capacity = round_down(dmz->dev[0].capacity, zone_nr_sectors);
> 
> is simpler :)
> 
> In any case, your change does seem to do anything here. Before and after, the
> capacity is rounded down to full zones, excluding the last runt zone. I think it
> is to do with the table entry start offset given on DM start by dmzadm...
> 
> 
>>          r = fn(ti, dmz->ddev[0], 0, capacity, data);
>>          if (!r && dmz->ddev[1]) {
>> -               capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
>> +               nr_zones = DIV_ROUND_DOWN(dmz->dev[1.capacity,
>> +                                                  zone_nr_sectors));
>> +               capacity = nr_zones * zone_nr_sectors;
>>                  r = fn(ti, dmz->ddev[1], 0, capacity, data);
>>          }
>>          return r;
>>
>> Cheers,

The failure of bdev_stack_limits() generating the warning is due to the io_opt
limit not being compatible with the physical blocks size... Nothing to do with
zone start/runt zones.

The problem is here:

	/* Optimal I/O a multiple of the physical block size? */
        if (t->io_opt & (t->physical_block_size - 1)) {
                t->io_opt = 0;
                t->misaligned = 1;
                ret = -1;
        }

For the ssd (t), I have io_opt at 512 and the physical block size at 4096,
changed due to the satcking from the device real 512 phys block to the smr disk
phys block. The SMR disk io_opt is 0, so the ssd io_opt remains unchaged at 512.
And we end up with the misaligned trigger since 512 & 4095 = 512...

I do not understand clearly yet... I wonder why the io_opt for the SMR drive is
not 4096, same as the physical sector size.

Late today. Will keep digging tomorrow.

Cheers.


>>
>> Hannes
>>
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

