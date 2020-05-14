Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AF4771D2822
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 08:46:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589438787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DDYfufyaXrzwQ+ZwQlCyOKL5i/X1u/fyWMwbKdjVU3Q=;
	b=Ter9D6xsvTTwSjJD1rHWGRQ9SNrLZ16+ZZpXH3OGE4dAIX0bzU7i+Eh6tsEtWofH2PfCFx
	UATRUHvPxoGolVoj6zdnp8Ot7fCYti9RXo7wVsWgcrw9gGn+BAs0arBBG7KyQbadFMvpCk
	WwiVNhFNoDsX+l8CJ9gphjYSOH/axw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-MN1G6rxDMZmsJ8CHe0q9uw-1; Thu, 14 May 2020 02:46:25 -0400
X-MC-Unique: MN1G6rxDMZmsJ8CHe0q9uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1C646A2BE;
	Thu, 14 May 2020 06:46:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C423A619D8;
	Thu, 14 May 2020 06:46:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F06D1809543;
	Thu, 14 May 2020 06:46:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E6k7ZY030566 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 02:46:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EAD7E2017F02; Thu, 14 May 2020 06:46:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCB702029F78
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:46:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1E551859173
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:46:03 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-17-EW9qwZwdMMy6xVvZKQPdsg-1; Thu, 14 May 2020 02:45:59 -0400
X-MC-Unique: EW9qwZwdMMy6xVvZKQPdsg-1
IronPort-SDR: u9zggIPVS04rl3qHz08DDdp/P4bMxeDoK670QT63GfzSTzG6k5xyzHXXAhNQQCkz2AZCmBuih0
	z+m56YSxEXRy7+l0NONRYgIDsBSJg6bAinVgztuOmBkmu01ObebpyTTmsvGN8hnbVlVjBUkra8
	4ow1aYOTIojffSRjFSsrFZlSWYxoz3gtxBQo2e8T4sgUR7N+ioCqgzMCFNS8I85WOHvwGozLuq
	LiCasZdNlg86uxuTToEuDlU+vWwYRLBEgJOgwJ/GTWRGw70yEo/IKXiyMvL7CVnq66MOiGC/jq
	s+g=
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; d="scan'208";a="137648573"
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
	by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 14:45:47 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6405.namprd04.prod.outlook.com (2603:10b6:a03:1ed::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25;
	Thu, 14 May 2020 06:45:46 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Thu, 14 May 2020 06:45:46 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/2] dm-zoned: split off random and cache zones
Thread-Index: AQHWKPUxxZHdPXh7K0y0k5U/Iw5OgA==
Date: Thu, 14 May 2020 06:45:46 +0000
Message-ID: <BY5PR04MB6900C924F85EE6007ACFE4C2E7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200513070729.71461-1-hare@suse.de>
	<20200513070729.71461-3-hare@suse.de>
	<BY5PR04MB6900F36D4228D0FD0216AD61E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<a95309e9-c0d1-cd9e-4e93-c7fb52667b2d@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 77df47c6-9fbc-4df9-5abd-08d7f7d26e46
x-ms-traffictypediagnostic: BY5PR04MB6405:
x-microsoft-antispam-prvs: <BY5PR04MB640555B195AD974F160AF7B7E7BC0@BY5PR04MB6405.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hljSn5ddxrqf1C8EYLIar+uc+aIZw65zG23cxcjocSoDm0tOpji/AjWcANL7WV2O4PjL+u9mj07p6xjpxIGd9NQzxK/k4FQcfkkLvhcQt8TR6Ab2tDa6tuDLZ010ZPgfMMn+sF4dLJVEWTKWmTHisVfLPuf4dH6gcjK4AaG/3GlUIdqr3vLZsJ9sEWLi/jfPjGbi3aWtnNo4gx3P/Wsu6VSV//4n/htxM6zM9KG+5XA+0laav/E81N3VO83cJaIif7J8EfbUa0mD96VWCTa74uBPoeGRV0g0iDzC0IYWcRdDmJMA9NV+rWm3vTtFR5tQ8/rUSCjkI1lhx67R6TfJnd1b/RWfFLjZh9X6U+XKUqokWjxIM8K9MwaiO+01kyVRqbnDw4IL5XamCnUtDezJ+pvnW9dQCFp//fWkx008qLy35864UfuBLYiChN2s6/Ux
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(8936002)(186003)(2906002)(33656002)(5660300002)(478600001)(71200400001)(52536014)(26005)(4326008)(316002)(55016002)(7696005)(66446008)(9686003)(64756008)(66946007)(53546011)(6506007)(8676002)(76116006)(86362001)(66556008)(66476007)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: /t4gSuJB7ZeTkGYVQpC2scjaoPaa9J4BIY9Z9kbXmQdrYk9bi1SdXqX2IFFVoRzJzwIZkJpreV5q5CqSCimQEiik0u4KkD7yldlN7GKk0aZQNil88DdisGWJXT86CcXCzP4SUUWNq+fhbwdsq3MXa+bGFdz5MB67XD+YP8loyV/mMFGXNVxaxE48kUWb/3rpB6jFlPHUC7/54k8wOpRLXQkE/0vG7zJvu0nO4ZN1+FPM3N9G5yAven+AG7puF05K/IkCJZmkFn7boKyEdOPyp5nQ5myRRdBhdB19jauuhxfXCGtYu2MxbVsOktsYfAd8aJD2K5JEzX8ITilC+5AHafNKy1dj0hwM2l2ZImQQQNaRg+fyfX5cRdDJWe/zXRLj7oxKapJsALkU7WroZGKOMLKYFfsA0lITsUXypilcRVIHt2cOmF6oAyt9vkOY/1G+mlvOxq80dNMmkNlf21wq97Tr6JJHQGAkC43jfsZi6mDV/FoRoPitSw1pwjC7lmZJ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77df47c6-9fbc-4df9-5abd-08d7f7d26e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 06:45:46.0615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tv7F4tcXjRaG8S02P+SknLJvvZhHxZyyMceWMGbvrBoek3BMaE18fDc0W/8v2MAxeGYL5CC5NOLv5bqlQw/DiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6405
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04E6k7ZY030566
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/2] dm-zoned: split off random and cache
	zones
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

On 2020/05/14 15:41, Hannes Reinecke wrote:
> On 5/13/20 2:44 PM, Damien Le Moal wrote:
>> On 2020/05/13 16:07, Hannes Reinecke wrote:
>>> Instead of emulating zones on the regular disk as random zones
>>> this patch adds a new 'cache' zone type.
>>> This allows us to use the random zones on the zoned disk as
>>> data zones (if cache zones are present), and improves performance
>>> as the zones on the (slower) zoned disk are then never used
>>> for caching.
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
> [ .. ]
>>> @@ -1830,17 +1861,19 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
>>>   }
>>>   
>>>   /*
>>> - * Select a random write zone for reclaim.
>>> + * Select a cache or random write zone for reclaim.
>>>    */
>>>   static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
>>>   {
>>>   	struct dm_zone *dzone = NULL;
>>>   	struct dm_zone *zone;
>>> +	struct list_head *zone_list = &zmd->map_rnd_list;
>>>   
>>> -	if (list_empty(&zmd->map_rnd_list))
>>> -		return ERR_PTR(-EBUSY);
>>> +	/* If we have cache zones select from the cache zone list */
>>> +	if (zmd->nr_cache)
>>> +		zone_list = &zmd->map_cache_list;
>>>   
>>> -	list_for_each_entry(zone, &zmd->map_rnd_list, link) {
>>> +	list_for_each_entry(zone, zone_list, link) {
>>>   		if (dmz_is_buf(zone))
>>>   			dzone = zone->bzone;
>>>   		else
>>> @@ -1853,15 +1886,21 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
>>>   }
>>>   
>>>   /*
>>> - * Select a buffered sequential zone for reclaim.
>>> + * Select a buffered random write or sequential zone for reclaim.
>>
>> Random write zoned should never be "buffered", or to be very precise, they will
>> be only during the time reclaim moves a cache zone data to a random zone. That
>> is visible in the dmz_handle_write() change that execute
>> dmz_handle_direct_write() for cache or buffered zones instead of using
>> dmz_handle_buffered_write(). So I think this comment can stay as is.
>>
>>>    */
>>>   static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
>>>   {
>>>   	struct dm_zone *zone;
>>>   
>>> -	if (list_empty(&zmd->map_seq_list))
>>> -		return ERR_PTR(-EBUSY);
>>> -
>>> +	if (zmd->nr_cache) {
>>> +		/* If we have cache zones start with random zones */
>>> +		list_for_each_entry(zone, &zmd->map_rnd_list, link) {
>>> +			if (!zone->bzone)
>>> +				continue;
>>> +			if (dmz_lock_zone_reclaim(zone))
>>> +				return zone;
>>> +		}
>>> +	}
>>
>> For the reason stated above, I think this change is not necessary either.
>>
> Ah. Indeed. The above hunk makes us reclaim the random zones, too, which
> strictly speaking isn't necessary.
> I'll be dropping it and see how things behave.
> 
>>>   	list_for_each_entry(zone, &zmd->map_seq_list, link) {
>>>   		if (!zone->bzone)
>>>   			continue;
>>> @@ -1911,6 +1950,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>>>   	unsigned int dzone_id;
>>>   	struct dm_zone *dzone = NULL;
>>>   	int ret = 0;
>>> +	int alloc_flags = zmd->nr_cache ? DMZ_ALLOC_CACHE : DMZ_ALLOC_RND;
>>>   
>>>   	dmz_lock_map(zmd);
>>>   again:
>>> @@ -1925,7 +1965,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>>>   			goto out;
>>>   
>>>   		/* Allocate a random zone */
>>> -		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>>> +		dzone = dmz_alloc_zone(zmd, alloc_flags);
>>>   		if (!dzone) {
>>>   			if (dmz_dev_is_dying(zmd)) {
>>>   				dzone = ERR_PTR(-EIO);
>>> @@ -2018,6 +2058,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>>>   				     struct dm_zone *dzone)
>>>   {
>>>   	struct dm_zone *bzone;
>>> +	int alloc_flags = zmd->nr_cache ? DMZ_ALLOC_CACHE : DMZ_ALLOC_RND;
>>>   
>>>   	dmz_lock_map(zmd);
>>>   again:
>>> @@ -2026,7 +2067,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>>>   		goto out;
>>>   
>>>   	/* Allocate a random zone */
>>> -	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>>> +	bzone = dmz_alloc_zone(zmd, alloc_flags);
>>>   	if (!bzone) {
>>>   		if (dmz_dev_is_dying(zmd)) {
>>>   			bzone = ERR_PTR(-EIO);
>>> @@ -2043,7 +2084,10 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>>>   	bzone->chunk = dzone->chunk;
>>>   	bzone->bzone = dzone;
>>>   	dzone->bzone = bzone;
>>> -	list_add_tail(&bzone->link, &zmd->map_rnd_list);
>>> +	if (alloc_flags == DMZ_ALLOC_CACHE)
>>> +		list_add_tail(&bzone->link, &zmd->map_cache_list);
>>> +	else
>>> +		list_add_tail(&bzone->link, &zmd->map_rnd_list);
>>>   out:
>>>   	dmz_unlock_map(zmd);
>>>   
>>> @@ -2059,31 +2103,53 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>>>   	struct list_head *list;
>>>   	struct dm_zone *zone;
>>>   
>>> -	if (flags & DMZ_ALLOC_RND)
>>> +	switch (flags) {
>>> +	case DMZ_ALLOC_CACHE:
>>> +		list = &zmd->unmap_cache_list;
>>> +		break;
>>> +	case DMZ_ALLOC_RND:
>>>   		list = &zmd->unmap_rnd_list;
>>> -	else
>>> -		list = &zmd->unmap_seq_list;
>>> +		break;
>>> +	default:
>>> +		if (zmd->nr_cache)> +			list = &zmd->unmap_rnd_list;
>>> +		else
>>> +			list = &zmd->unmap_seq_list;
>>> +		break;
>>> +	}
>>>   again:
>>>   	if (list_empty(list)) {
>>>   		/*
>>> -		 * No free zone: if this is for reclaim, allow using the
>>> -		 * reserved sequential zones.
>>> +		 * No free zone: return NULL if this is for not reclaim.
>>
>> s/for not reclaim/not for reclaim
>>
> [ .. ]
>>
>> Apart from the nits above, all look good. I am running this right now and it is
>> running at SMR drive speed ! Awesome ! Will send a plot once the run is over.
>>
> Thanks. I'll be respinning the patch and wil be reposting it.

Can you check the reclaim trigger too ? It seems to be starting way too early,
well before half of the SSD is used... Was about to rerun some tests and debug
that but since you need to respin the patch...

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

