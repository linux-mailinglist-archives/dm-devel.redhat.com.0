Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E29B61A7338
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 07:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586843963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6aBwokxxhJcaulOuvfDMQtzdsmAn9bMy8GJ1K1RE7Jc=;
	b=PIEEmYeSYrfm1M7JtelCiwoHpME/NjsOh4Pap024m0xCb6owRlqmCtzJugD1PTYn3bZpLT
	XiBcvUy4zU96Dy0Z8TRRew2v2rsn5sHatYPktndOx88uBWaDeN2nq0uJ3/UYGrbHpoXNnO
	Tqk6iYOJWOJIfydMNy7n26BdrYM7NAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-_vCLhqCWOxCnJ4xy1S1N5Q-1; Tue, 14 Apr 2020 01:59:21 -0400
X-MC-Unique: _vCLhqCWOxCnJ4xy1S1N5Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27AF8102C8C2;
	Tue, 14 Apr 2020 05:59:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 161C819C58;
	Tue, 14 Apr 2020 05:59:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFB1693065;
	Tue, 14 Apr 2020 05:59:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03E5wtkM003090 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 01:58:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3831D1D0D; Tue, 14 Apr 2020 05:58:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEC8AD1D0B
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 05:58:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9E80868C8B
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 05:58:52 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24-DtOxTIW_PjGK-gS9pl26LQ-1; Tue, 14 Apr 2020 01:58:49 -0400
X-MC-Unique: DtOxTIW_PjGK-gS9pl26LQ-1
IronPort-SDR: cZjoph5xVZ0tYrAvljJubjlg6VTLpS/KoXASUqfeZ0vs0+GjXb0e6FmkUkbXqQf1CTwe9EkXdV
	sbV+drvefJn9wiBAPhjd4jL5nhbzv6SwD9GHd82hmHTmUM3LvRHp0HPuY0ECkmnltSOer276sQ
	ml+4yaUc7OgLYZKNXHXJ3fCpq9jXn0Uqd4BJ6BHispflIkTNQ4JJTVZIIcS+MO6pbQJPsIfweL
	5ilkNXmnRNlpUqOlZCXlnmgtLiWTRhwk+aiTGZz533TChPw4D2IK1OF20yLWfly/KpXYw/DRHA
	pAU=
X-IronPort-AV: E=Sophos;i="5.72,381,1580745600"; d="scan'208";a="136709623"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
	by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2020 13:58:47 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6993.namprd04.prod.outlook.com (2603:10b6:a03:226::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28;
	Tue, 14 Apr 2020 05:58:44 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.2900.028;
	Tue, 14 Apr 2020 05:58:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 11/11] dm-zoned: metadata version 2
Thread-Index: AQHWDjp7RjuKL/GlbUavW5RYFo/g9Q==
Date: Tue, 14 Apr 2020 05:58:44 +0000
Message-ID: <BY5PR04MB6900554B6F4AA00619BDC67FE7DA0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200409064527.82992-1-hare@suse.de>
	<20200409064527.82992-12-hare@suse.de>
	<BY5PR04MB690091C3AD432DCF2B08658FE7DD0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<7f791599-afca-cc07-31f0-bc1cd4702dae@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 51044755-c1d6-4de3-7ffa-08d7e038e429
x-ms-traffictypediagnostic: BY5PR04MB6993:
x-microsoft-antispam-prvs: <BY5PR04MB6993FC40A7C6DD2E9D0941E5E7DA0@BY5PR04MB6993.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(366004)(55016002)(110136005)(76116006)(64756008)(6506007)(53546011)(81156014)(71200400001)(9686003)(8676002)(7696005)(66476007)(8936002)(4326008)(66556008)(66446008)(33656002)(66946007)(26005)(54906003)(186003)(91956017)(52536014)(2906002)(5660300002)(86362001)(498600001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JtgOTSQYbtYsAdxjevEFMpovNcqmGAXx7KRlOiv2LHU+Qfpp5AJ/qI+jdC8gDdeyxgjcXNziUsfqZ1Y/Q+YPiDLyJGw0ERBT3aR4Dyx3PyeGiYTUedARMEbeqe7N1SWwN8O4zikCagb/Lm/TCAA0yiAt3FfBWjdESrIPAGD7bjMrhbABnnJqMq9jX++knYBy7c1k5I0l9u3I5fecdKd4ANmiE2vA5BXzE+6QOYUe4TyFJrrtqMX2+Px3OvJqfj/0Ve9TNieTu/8hm/eYmfeSzhdS5+B8mO5w6fq2N1/ICibmNUftv+xumKbD7ChObYOUJM+YUA4mw3Oi8HZlvG5FGbPYQoQj0S1FacSJnWGH2x2g9zdk6qwbzxtFQioIJREC72Kzj+p/NM+nyYH4c1PnG6C6sBISrAygEEAnG+NoCFMgjz3YHgmcZvFPhwKuHk0D
x-ms-exchange-antispam-messagedata: ECvTpL1b+Jq8sOLu7RJe4i6+NrUV117mRki0+tt6hoVS6bSd9ctyBJZRA8FoRqqf2b0uGTzUS3/M8NT/emUnKyAgx8ipBqNICf+Zt1XxR25XmLqcyYk+56SUFy2HuWxovjE5ybu27ScAV8S7xAPgnw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51044755-c1d6-4de3-7ffa-08d7e038e429
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 05:58:44.4570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPzSQV48QLtsNKrFNhxOeOYvcUDoslgXs+kGkhXt8fSkMSzry5uF9POs4zETQeuTQNtB3Op/guvU/LypF9/5Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6993
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03E5wtkM003090
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 11/11] dm-zoned: metadata version 2
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/14 14:47, Hannes Reinecke wrote:
[...]
>>> +
>>> +	if (zmd->dev[0].zone_offset &&
>>> +	    zone->id < zmd->dev[0].zone_offset)
>>> +			return &zmd->dev[1];
>>> +
>>>   	return &zmd->dev[0];
>>>   }
>>
>> OK. This one still confuses me. I think we need to have a comment here reminding
>> that when there are 2 devices, the second one holds the low ID zones and the
>> first one (the SMR drive) the high ID zones. While I think it is OK as is (with
>> the comment), I still think we should reverse that as the reverse would be more
>> natural...
>>
> Sure, we can reverse the order of devices by using the regular disk 
> device as first and the SMR drive as second argument when creating the 
> device-mapper device:
> 
> 0 <size> zoned <regular device> <zoned device>
> 
> That would make it more natural, and we don't have to rearrange disks 
> within the code.
> 
> We'd lose compability with v1, but one could argue it's not a bad thing.

Not sure what you mean here. For the single drive case, we would have:

0 <size> zoned <zoned device>

and the zoned device ending up in zmd->dev[0]. The format can be V1 or v2 single
drive. Where is the problem ? Similarly to the V2 2-drive case, in this case too
zmd->dev[0] holds the metadata and random zones. So it should still work as
is... Or am I missing something ?

[...]
>>> -	dev->zone_nr_sectors = blk_queue_zone_sectors(q);
>>> -
>>> -	dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
>>> -
>>> -	dmz->dev = dev;
>>> -
>>> +	if (num == 1) {
>>> +		dev->zone_nr_sectors = dmz->dev[0].zone_nr_sectors;
>>> +		dev->nr_zones = dev->capacity / dev->zone_nr_sectors;
>>> +		if (dev->capacity % dev->nr_zones)
>>> +			dev->nr_zones++;
>>
>> dev->nr_zones =
>> 	(dev->capacity + dev->zone_nr_sectors - 1) / dev->zone_nr_sectors;
>>
>> or use DIV_ROUND_UP() ?
>>
> OK.
> 
>> And may be add a comment to remind (again) that znd->dev[1] is the normal disk
>> so we cannot use blk_queue_zone_sectors() and blkdev_nr_zones().
>>
> Or, better still, check if it's a regular device and drop the magic 'num 
> == 1' comparison.

Yes, that would be easier !

Best.

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

