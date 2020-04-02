Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0713019BA6D
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 04:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585795614;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lhJOpd1yyYdjN40NRSwePrXyLl6GBbPE+VtEnArwsSA=;
	b=iuScWEhkfbGbymrlCfAjClKtUr+pGuuCrwBzakMOD1THWsWi/0jyljFL+O1egB15s69uwN
	GPyc7yNj2WVP8TyRcfpnft6TgL4zspKegsBbBP7f5iE5WPEFcK2E2Hg5cymg2kjtm6+lrE
	ekAC7EC/AlkwBR351HZFGsQsZfgojOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-BZAwcTsSMvuKx2W7RAyG_w-1; Wed, 01 Apr 2020 22:46:52 -0400
X-MC-Unique: BZAwcTsSMvuKx2W7RAyG_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F7628018A9;
	Thu,  2 Apr 2020 02:46:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8E1FD768F;
	Thu,  2 Apr 2020 02:46:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 934E08B2AE;
	Thu,  2 Apr 2020 02:46:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0322j9fJ021896 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Apr 2020 22:45:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B93B611D29D; Thu,  2 Apr 2020 02:45:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B48FD11D29F
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 02:45:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2828D185A78E
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 02:45:07 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-201-C03oA71eMOe1BKo2l6sbhQ-1; Wed, 01 Apr 2020 22:45:03 -0400
X-MC-Unique: C03oA71eMOe1BKo2l6sbhQ-1
IronPort-SDR: Tyljs9K40/4nwCHoMHrjmPYVlVTv0jfxY6EQ38c3nZLQ3gx7nnXBRk/LnQzgffwaDVlkuwqTub
	Z/PMzReOLqDTCkLma8hmRd21p5+QPnI8hxsFP6WQNdeVFBsiZIo89Ytzbsj2X3DiG2wMZPPjRg
	TWArv+JnkPYKUWC9P7CQ5J6eHd3QKdZYf3fLohUFR0sHXAUnIQUCEdd6v0mEQFZqpRz7rV4F8T
	y3yZYvLEwqor2j0XyjeVvLHbglvlP+3yb5KNCzUZ50O9M9pWBL3jOZDTgQioXH5GCCGB5acsRP
	nBA=
X-IronPort-AV: E=Sophos;i="5.72,334,1580745600"; d="scan'208";a="135826503"
Received: from mail-cys01nam02lp2052.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.52])
	by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2020 10:45:01 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2264.namprd04.prod.outlook.com (2603:10b6:102:15::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20;
	Thu, 2 Apr 2020 02:45:00 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2878.014;
	Thu, 2 Apr 2020 02:45:00 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 4/4] dm-zoned: allow for device size smaller than the
	capacity
Thread-Index: AQHWBAd4Lw970VOCKUuf0n+JOgdZJA==
Date: Thu, 2 Apr 2020 02:45:00 +0000
Message-ID: <CO2PR04MB2343CFAF3E68FC7D53CFFC00E7C60@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-5-hare@suse.de>
	<CO2PR04MB2343240ACAC524067A074813E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
	<3167d430-9987-150b-363d-dfce119a04b8@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 283e7e69-0be3-47f4-6268-08d7d6afd69a
x-ms-traffictypediagnostic: CO2PR04MB2264:
x-microsoft-antispam-prvs: <CO2PR04MB22649B658030A04A46B48991E7C60@CO2PR04MB2264.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CO2PR04MB2343.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(33656002)(91956017)(186003)(66556008)(6506007)(54906003)(66446008)(71200400001)(64756008)(55016002)(76116006)(52536014)(4326008)(26005)(66946007)(9686003)(110136005)(316002)(8936002)(8676002)(66476007)(478600001)(7696005)(2906002)(53546011)(86362001)(81156014)(81166006)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ku7P5F9xdfYgMWZEMSD1k5gRFVBJu+ZhrzChNYxRf7RYLmDXLwC53RwYLyXyMuupTzREKiwlfYFNeFPMsfov0cKp2F1ycrDj/clwcQMvGiMqSj+lx3+R+t+OTMQBUxVUxgtRPDu3vz0AefI/jswDNbt1QvEMMOhSCA/RoQfklGDy+5NS6dNX/5LGDqlTf4o2sUNoyDwvxAKVnmUmVuZNj8kH/lDWMgTNw7ruHGTrk1FAdqA0ByCRgVjAsedCvNW6StO+q+Y6Lrc/tSc501uuP9UCbcxTm2UwWbAJ53/WtHSgUgcHcTVjivN8otLLVdi1vp1XJsMcBAEqdTEIH6NzM9m8WWmnPcgTo+qyjpI4T3EimP4lnp1qZBlT2oh17AHNi+qMeZCSy+L/TcuLoSfxlIRM2sDLExaFUY4D+ulroUF5DK8KBS/Y5wb1dWXx5UHk
x-ms-exchange-antispam-messagedata: Vp/j2IasFIzxM2Gh3srkglV/sYD8i2fKiYvXQ+p2/iAbHvdVTBdX848PrvzdLoM47CDuB2VuJQ0o831d70JSaNlAQnFXqLr8PmARZ6J2UkzPkx9nGzbK/muoQIog1zITqkNiEZK+LJcyk0JhlF3dgA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283e7e69-0be3-47f4-6268-08d7d6afd69a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 02:45:00.2997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4KegbuDl4acyOlUCSM7B411Al16zg3woSRjQI/5lF7w7O/MgcdoCVOorqC5xiPYRoL8Cz73wtMARmmZU/DeLQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2264
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0322j9fJ021896
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] dm-zoned: allow for device size smaller
 than the capacity
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/03/31 17:53, Hannes Reinecke wrote:
> On 3/31/20 2:49 AM, Damien Le Moal wrote:
>> On 2020/03/27 16:15, Hannes Reinecke wrote:
>>> dm-zoned requires several zones for metadata and chunk bitmaps,
>>> so it cannot expose the entire capacity as the device size.
>>> Originally the code would check for the capacity being equal to
>>> the device size, which is arguably wrong.
>>> So relax this check and increase the interface version number
>>> to signal to userspace that it can set a smaller device size.
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>   drivers/md/dm-zoned-target.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
>>> index 7ec9dde24516..89a825d1034e 100644
>>> --- a/drivers/md/dm-zoned-target.c
>>> +++ b/drivers/md/dm-zoned-target.c
>>> @@ -715,7 +715,7 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
>>>   	aligned_capacity = dev->capacity &
>>>   				~((sector_t)blk_queue_zone_sectors(q) - 1);
>>>   	if (ti->begin ||
>>> -	    ((ti->len != dev->capacity) && (ti->len != aligned_capacity))) {
>>> +	    ((ti->len > dev->capacity) && (ti->len > aligned_capacity))) {
>>>   		ti->error = "Partial mapping not supported";
>>
>> The message is now wrong. Also, the condition can now be simplified to:
>>
>> if ((ti->begin + ti->len) > aligned_capacity) {
>>
>> Since aligned capacity is equal or smaller than dev capacity. And we have to
>> account for the potential non-zero begin.
>>
> _Actually_ I would forbid for 'ti->begin' to be anything other than 0.
> For a zoned device there is no point in allowing for partial handling at 
> all.
> Problem is that 'dev->capacity' is the capacity of the zoned block 
> device, whereas 'ti-len' is the exported capacity of the device-mapper 
> device, which is smaller than the device capacity by the number of 
> metadata blocks/zones.

OK. Got it. I misunderstood that. Sounds good to me.

> 
>>>   		ret = -EINVAL;
>>>   		goto err;
>>> @@ -1008,7 +1008,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
>>>   
>>>   static struct target_type dmz_type = {
>>>   	.name		 = "zoned",
>>> -	.version	 = {1, 2, 0},
>>> +	.version	 = {1, 3, 0},
>>>   	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
>>>   	.module		 = THIS_MODULE,
>>>   	.ctr		 = dmz_ctr,
>>>
>>
>> I do not think this is nearly enough: dmz_init_zones() is still considering the
>> entire drive and does a zone report from 0 on the backend bdev. It should start
>> at ti->begin and up to ti->begin+ti->len, no ?
>>
> Yes, and no. I want to disallow 'ti->begin' to be anything else than 0 
> as ti->begin and ti->len are relative to exported device-mapper device, 
> and we always want to have block 0 mapped :-)
> 
> And as such dmz_init_zones() needs to cover all zones, as this is 
> relative to the zoned block device.

Yes. Which is already the case since we need to see the metatdata and reserved
zones too. Makes sense.

> 
>> Furthermore, this introduce a change in the meaning of the zone ID. Since this
>> is set to the index of the zone in the report (patch 1), if the mapping is
>> partial and the zone report does not start at 0, then zone ID is not zone number
>> on the device anymore. So dmz_start_block() needs to be offset by ti->begin
>> otherwise IOs will go to the wrong zones.
>>
> As I said: We will never do a partial mapping.
> What this patch does it to bring the device-mapper mapping in-line with 
> the exported device size.

Got it !

> Originally we would export a device-mapper mapping for blocks up to the 
> zone-device capacity. As the resulting device-mapper block device has a 
> smaller capacity than the mapping would allow for those 'spare' blocks 
> would never been used, thus the invalid mapping was never triggered.
> 
> What this patch does is to bring the device-mapper mapping in-line with 
> the exported block device capacity, so that we don't have an invalid 
> mapping. Nothing else has (and should) be changed.
> 
> Especially not the partial zoned device handling :-)

OK. Thanks for doing that ! I  totally missed these points when I wrote the
mapper :)

Cheers.

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

