Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E5C0E1E08B8
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 10:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590395012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WXi4bITHYXemv3ee8PMRYChYlGMkGADLm2y81ydnEQs=;
	b=LwNS/3TzF5P6AZ/Kupo3J2+IAi+f3evZDlMaylIlQ+s7puC3DOJDNtaevQehjwdXfCTWrm
	/otsDRnrYutSnwYH9cqaLznMSparpyQhzqCurP4QyDffKC0NX655E3R89QWz9HMwdiCneE
	vUOPfBWzwS7ohN9g+j0npctadmzaWnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-royn_9rKOVCNIweR_-hjxw-1; Mon, 25 May 2020 04:23:30 -0400
X-MC-Unique: royn_9rKOVCNIweR_-hjxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7960C1855A06;
	Mon, 25 May 2020 08:23:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC72F83846;
	Mon, 25 May 2020 08:23:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 989391809543;
	Mon, 25 May 2020 08:23:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P8N615026040 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 04:23:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3AE162157F24; Mon, 25 May 2020 08:23:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E0332166BA4
	for <dm-devel@redhat.com>; Mon, 25 May 2020 08:23:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C28F28F7A0C
	for <dm-devel@redhat.com>; Mon, 25 May 2020 08:23:02 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-311-qh930ZjAPfWGOhZYD52YXw-1; Mon, 25 May 2020 04:22:58 -0400
X-MC-Unique: qh930ZjAPfWGOhZYD52YXw-1
IronPort-SDR: q8WuU7aWdJJqQ2hD7cpdUCIwSX7+9+T7jK4PLSlZWpN6Rx5vMs9mbnCkS37B3OKNBnVaZ74TRg
	rzhgl5mh6ITKxVonLyjLiuap1cQe9+N8hbJxl62S2SbwkLCamxw8XXt88zUOgmGnUU0roOzymG
	IlX51o1rSDtAz8pjX+qxXJjyCs6I/dts24A46Dm8F9wBSsJZmlJEMQZj7AtS4qZK/ui4PUZ2ob
	/fdriT7wvMAq/0aCuqLUIxsTuLlOdEGKWVsu78EGq6eoWHwNlVJEkvicZoi7XtU/rmbaXZK2k+
	5z8=
X-IronPort-AV: E=Sophos;i="5.73,432,1583164800"; d="scan'208";a="138450822"
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 16:22:56 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0470.namprd04.prod.outlook.com (2603:10b6:903:b1::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27;
	Mon, 25 May 2020 08:22:55 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 08:22:55 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 10/12] dm-zoned: support arbitrary number of devices
Thread-Index: AQHWME8oYy5OCM8/+kSnpWobCWKMxw==
Date: Mon, 25 May 2020 08:22:55 +0000
Message-ID: <CY4PR04MB3751A01110515AE5F82E4D96E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-11-hare@suse.de>
	<CY4PR04MB3751A184940AC59203AC4D33E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
	<c1e5003c-05ca-e441-b368-8e2707da438f@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5f818366-4775-41e9-45f3-08d80084d34a
x-ms-traffictypediagnostic: CY4PR04MB0470:
x-microsoft-antispam-prvs: <CY4PR04MB0470AB7931FFF1A1968A84E3E7B30@CY4PR04MB0470.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0H/6oFxll3aJ9rEzI2Raz1Rs09B6dp/cYpBV9CQIHRpm6f9F2/6/zIG4N0Qgpu1QgUomCa3otrCCf7mOjy2kvgxnO8SZPaBfmukTPBHSRVwqxmFvj/E7SJRMLH/Yq8bB+91iykviSTPwsoP3GEexm+5H8kXSE6vf6o++7n5pOaEI3DwqafXlNcvvFmkbmEEfclLeVXWd2BMCc00a1rZWa4ZItt+p1LQ2WNqd5dj2z66ea9pHcSH0H1FcpcrUuC5egfl+Wm0ID2frRWz8NI3lZ25yIWy9eHwUgWt0pfztJli90gdsfjbihIq46j7lTlFUHP8+vcD89PeKfasnDXowgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(8936002)(55016002)(9686003)(66446008)(2906002)(8676002)(26005)(33656002)(54906003)(5660300002)(6506007)(53546011)(316002)(30864003)(66556008)(66476007)(64756008)(66946007)(76116006)(7696005)(478600001)(91956017)(4326008)(6916009)(71200400001)(86362001)(186003)(52536014);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: ELCrsbiLmwCz7ZwUube04MHDs2ZeUHLrpyE43xebcAFkuSvAZc6ZJQ7aDGHCvUmq+M+029PYMrmWWUhMMGB2fMXg36hQq8G8zx2o5MnoEUkWwS9aY7K8vEt2YpLgHmftlPrTauX1RsBWGE4rPJcQCpSI0nRywZJo6OGojjIJTkUmdpI1qxbq0tAYXSK3VpTehCStX3OX/brKDQKDrKSf9D6LPRkmJKNLICqpiEoxwUwgfrgfPJpcTAQfWtUg61sydxKxTpIZo1J4yHhdX94fTcRtZCixzis1L3yA/XXm0Hh5kq5TjyCeoqjmpZraPr92P1vr/E12oHD2yFpwC/QGTWS7LnndjBT71zdVHucdpwp18cHLLk/C/SwAfPKgQSZb2WMO3ok48khetNRqg6RJg85fMvPaLAqE5uiKaVduVqIZBgOr2fAoENKBaBV2ioU1TrGOup0ehAxcvGmybJkz33VK3l1jT6cb1qC4JFq/UyA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f818366-4775-41e9-45f3-08d80084d34a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 08:22:55.1779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s8d7Z12WjGaFd0maKWdp6D33ZSI/ErnwreVGkX2y/haeoJBVdCRLkc/rQuSNFKzKAHBsKk/X3YHB3wFVkXQcJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0470
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P8N615026040
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 10/12] dm-zoned: support arbitrary number of
	devices
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

On 2020/05/25 16:52, Hannes Reinecke wrote:
> On 5/25/20 4:36 AM, Damien Le Moal wrote:
>> On 2020/05/23 0:39, Hannes Reinecke wrote:
>>> Remove the hard-coded limit of two devices and support an unlimited
>>> number of additional zoned devices.
>>> With that we need to increase the device-mapper version number to
>>> 3.0.0 as we've modified the interface.
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>   drivers/md/dm-zoned-metadata.c |  68 +++++++++++-----------
>>>   drivers/md/dm-zoned-reclaim.c  |  28 ++++++---
>>>   drivers/md/dm-zoned-target.c   | 129 +++++++++++++++++++++++++----------------
>>>   drivers/md/dm-zoned.h          |   9 +--
>>>   4 files changed, 139 insertions(+), 95 deletions(-)
>>>
>>> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
>>> index 5f44970a6187..87784e7785bc 100644
>>> --- a/drivers/md/dm-zoned-metadata.c
>>> +++ b/drivers/md/dm-zoned-metadata.c
>>> @@ -260,6 +260,11 @@ unsigned int dmz_zone_nr_sectors_shift(struct dmz_metadata *zmd)
>>>   	return zmd->zone_nr_sectors_shift;
>>>   }
>>>   
>>> +unsigned int dmz_nr_devs(struct dmz_metadata *zmd)
>>> +{
>>> +	return zmd->nr_devs;
>>> +}
>>
>> Is this helper really needed ?
>>
> 
> Yes, in dm-zoned-reclaim.c

I meant to say: whoever needs to know the number of devices can just use
"zmd->nr_devs". No need for a helper for that was my point.


> 
>>> +
>>>   unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
>>>   {
>>>   	return zmd->nr_zones;
>>> @@ -270,24 +275,14 @@ unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
>>>   	return zmd->nr_chunks;
>>>   }
>>>   
>>> -unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd)
>>> +unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd, int idx)
>>>   {
>>> -	unsigned int nr_rnd_zones = 0;
>>> -	int i;
>>> -
>>> -	for (i = 0; i < zmd->nr_devs; i++)
>>> -		nr_rnd_zones += zmd->dev[i].nr_rnd;
>>> -	return nr_rnd_zones;
>>> +	return zmd->dev[idx].nr_rnd;
>>
>> AH. OK. So my comment on patch 8 is voided :)
>>
> Yeah, the patch arrangement could be improved; I'll see to roll both 
> changes into one patch.
> 
>>>   }
>>>   
>>> -unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
>>> +unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd, int idx)
>>>   {
>>> -	unsigned int nr_unmap_rnd_zones = 0;
>>> -	int i;
>>> -
>>> -	for (i = 0; i < zmd->nr_devs; i++)
>>> -		nr_unmap_rnd_zones += atomic_read(&zmd->dev[i].unmap_nr_rnd);
>>> -	return nr_unmap_rnd_zones;
>>> +	return atomic_read(&zmd->dev[idx].unmap_nr_rnd);
>>>   }
>>>   
>>>   unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd)
>>> @@ -300,24 +295,14 @@ unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
>>>   	return atomic_read(&zmd->unmap_nr_cache);
>>>   }
>>>   
>>> -unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
>>> +unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd, int idx)
>>>   {
>>> -	unsigned int nr_seq_zones = 0;
>>> -	int i;
>>> -
>>> -	for (i = 0; i < zmd->nr_devs; i++)
>>> -		nr_seq_zones += zmd->dev[i].nr_seq;
>>> -	return nr_seq_zones;
>>> +	return zmd->dev[idx].nr_seq;
>>>   }
>>>   
>>> -unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
>>> +unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd, int idx)
>>>   {
>>> -	unsigned int nr_unmap_seq_zones = 0;
>>> -	int i;
>>> -
>>> -	for (i = 0; i < zmd->nr_devs; i++)
>>> -		nr_unmap_seq_zones += atomic_read(&zmd->dev[i].unmap_nr_seq);
>>> -	return nr_unmap_seq_zones;
>>> +	return atomic_read(&zmd->dev[idx].unmap_nr_seq);
>>>   }
>>>   
>>>   static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
>>> @@ -1530,7 +1515,20 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>>>   		 */
>>>   		zmd->sb[0].zone = dmz_get(zmd, 0);
>>>   
>>> -		zoned_dev = &zmd->dev[1];
>>> +		for (i = 1; i < zmd->nr_devs; i++) {
>>> +			zoned_dev = &zmd->dev[i];
>>> +
>>> +			ret = blkdev_report_zones(zoned_dev->bdev, 0,
>>> +						  BLK_ALL_ZONES,
>>> +						  dmz_init_zone, zoned_dev);
>>> +			if (ret < 0) {
>>> +				DMDEBUG("(%s): Failed to report zones, error %d",
>>> +					zmd->devname, ret);
>>> +				dmz_drop_zones(zmd);
>>> +				return ret;
>>> +			}
>>> +		}
>>> +		return 0;
>>>   	}
>>>   
>>>   	/*
>>> @@ -2921,10 +2919,14 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>>>   		      zmd->nr_data_zones, zmd->nr_chunks);
>>>   	dmz_zmd_debug(zmd, "    %u cache zones (%u unmapped)",
>>>   		      zmd->nr_cache, atomic_read(&zmd->unmap_nr_cache));
>>> -	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
>>> -		      dmz_nr_rnd_zones(zmd), dmz_nr_unmap_rnd_zones(zmd));
>>> -	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
>>> -		      dmz_nr_seq_zones(zmd), dmz_nr_unmap_seq_zones(zmd));
>>> +	for (i = 0; i < zmd->nr_devs; i++) {
>>> +		dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
>>> +			      dmz_nr_rnd_zones(zmd, i),
>>> +			      dmz_nr_unmap_rnd_zones(zmd, i));
>>> +		dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
>>> +			      dmz_nr_seq_zones(zmd, i),
>>> +			      dmz_nr_unmap_seq_zones(zmd, i));
>>> +	}
>>>   	dmz_zmd_debug(zmd, "  %u reserved sequential data zones",
>>>   		      zmd->nr_reserved_seq);
>>>   	dmz_zmd_debug(zmd, "Format:");
>>> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
>>> index fba0d48e38a7..f2e053b5f2db 100644
>>> --- a/drivers/md/dm-zoned-reclaim.c
>>> +++ b/drivers/md/dm-zoned-reclaim.c
>>> @@ -442,15 +442,18 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
>>>   {
>>>   	struct dmz_metadata *zmd = zrc->metadata;
>>>   	unsigned int nr_cache = dmz_nr_cache_zones(zmd);
>>> -	unsigned int nr_rnd = dmz_nr_rnd_zones(zmd);
>>> -	unsigned int nr_unmap, nr_zones;
>>> +	unsigned int nr_unmap = 0, nr_zones = 0;
>>>   
>>>   	if (nr_cache) {
>>>   		nr_zones = nr_cache;
>>>   		nr_unmap = dmz_nr_unmap_cache_zones(zmd);
>>>   	} else {
>>> -		nr_zones = nr_rnd;
>>> -		nr_unmap = dmz_nr_unmap_rnd_zones(zmd);
>>> +		int i;
>>> +
>>> +		for (i = 0; i < dmz_nr_devs(zmd); i++) {
>>> +			nr_zones += dmz_nr_rnd_zones(zmd, i);
>>
>> May be not... We could keep constant totals in zmd to avoid this.
>>
>>> +			nr_unmap += dmz_nr_unmap_rnd_zones(zmd, i);
>>> +		}
>>>   	}
>>>   	return nr_unmap * 100 / nr_zones;
>>>   }
>>> @@ -460,7 +463,11 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
>>>    */
>>>   static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
>>>   {
>>> -	unsigned int nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);
>>> +	int i;
>>> +	unsigned int nr_reclaim = 0;
>>> +
>>> +	for (i = 0; i < dmz_nr_devs(zrc->metadata); i++)
>>> +		nr_reclaim += dmz_nr_rnd_zones(zrc->metadata, i);
>>>   
>>>   	if (dmz_nr_cache_zones(zrc->metadata))
>>>   		nr_reclaim += dmz_nr_cache_zones(zrc->metadata);
>>> @@ -487,8 +494,8 @@ static void dmz_reclaim_work(struct work_struct *work)
>>>   {
>>>   	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
>>>   	struct dmz_metadata *zmd = zrc->metadata;
>>> -	unsigned int p_unmap;
>>> -	int ret;
>>> +	unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
>>> +	int ret, i;
>>>   
>>>   	if (dmz_dev_is_dying(zmd))
>>>   		return;
>>> @@ -513,14 +520,17 @@ static void dmz_reclaim_work(struct work_struct *work)
>>>   		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
>>>   	}
>>>   
>>> +	for (i = 0; i < dmz_nr_devs(zmd); i++) {
>>> +		nr_unmap_rnd += dmz_nr_unmap_rnd_zones(zmd, i);
>>> +		nr_rnd += dmz_nr_rnd_zones(zmd, i);
>>> +	}
>>>   	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
>>>   		dmz_metadata_label(zmd),
>>>   		zrc->kc_throttle.throttle,
>>>   		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
>>>   		p_unmap, dmz_nr_unmap_cache_zones(zmd),
>>>   		dmz_nr_cache_zones(zmd),
>>> -		dmz_nr_unmap_rnd_zones(zmd),
>>> -		dmz_nr_rnd_zones(zmd));
>>> +		nr_unmap_rnd, nr_rnd);
>>>   
>>>   	ret = dmz_do_reclaim(zrc);
>>>   	if (ret && ret != -EINTR) {
> 
> In the light of this I guess there is a benefit from having the counters
> in the metadata; that indeed would save us to having to export the 
> number of devices.
> I'll give it a go with the next round.
> 
>>> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
>>> index bca9a611b8dd..f34fcc3f7cc6 100644
>>> --- a/drivers/md/dm-zoned-target.c
>>> +++ b/drivers/md/dm-zoned-target.c
>>> @@ -13,8 +13,6 @@
>>>   
>>>   #define DMZ_MIN_BIOS		8192
>>>   
>>> -#define DMZ_MAX_DEVS		2
>>> -
>>>   /*
>>>    * Zone BIO context.
>>>    */
>>> @@ -40,9 +38,10 @@ struct dm_chunk_work {
>>>    * Target descriptor.
>>>    */
>>>   struct dmz_target {
>>> -	struct dm_dev		*ddev[DMZ_MAX_DEVS];
>>> +	struct dm_dev		**ddev;
>>> +	unsigned int		nr_ddevs;
>>>   
>>> -	unsigned long		flags;
>>> +	unsigned int		flags;
>>>   
>>>   	/* Zoned block device information */
>>>   	struct dmz_dev		*dev;
>>> @@ -764,7 +763,7 @@ static void dmz_put_zoned_device(struct dm_target *ti)
>>>   	struct dmz_target *dmz = ti->private;
>>>   	int i;
>>>   
>>> -	for (i = 0; i < DMZ_MAX_DEVS; i++) {
>>> +	for (i = 0; i < dmz->nr_ddevs; i++) {
>>>   		if (dmz->ddev[i]) {
>>>   			dm_put_device(ti, dmz->ddev[i]);
>>>   			dmz->ddev[i] = NULL;
>>> @@ -777,21 +776,35 @@ static int dmz_fixup_devices(struct dm_target *ti)
>>>   	struct dmz_target *dmz = ti->private;
>>>   	struct dmz_dev *reg_dev, *zoned_dev;
>>>   	struct request_queue *q;
>>> +	sector_t zone_nr_sectors = 0;
>>> +	int i;
>>>   
>>>   	/*
>>> -	 * When we have two devices, the first one must be a regular block
>>> -	 * device and the second a zoned block device.
>>> +	 * When we have more than on devices, the first one must be a
>>> +	 * regular block device and the others zoned block devices.
>>>   	 */
>>> -	if (dmz->ddev[0] && dmz->ddev[1]) {
>>> +	if (dmz->nr_ddevs > 1) {
>>>   		reg_dev = &dmz->dev[0];
>>>   		if (!(reg_dev->flags & DMZ_BDEV_REGULAR)) {
>>>   			ti->error = "Primary disk is not a regular device";
>>>   			return -EINVAL;
>>>   		}
>>> -		zoned_dev = &dmz->dev[1];
>>> -		if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
>>> -			ti->error = "Secondary disk is not a zoned device";
>>> -			return -EINVAL;
>>> +		for (i = 1; i < dmz->nr_ddevs; i++) {
>>> +			zoned_dev = &dmz->dev[i];
>>> +			if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
>>> +				ti->error = "Secondary disk is not a zoned device";
>>> +				return -EINVAL;
>>> +			}
>>> +			q = bdev_get_queue(zoned_dev->bdev);
>>
>> May be add a comment here that we must check that all zoned devices have the
>> same zone size ?
>>
> 
> I thought it was self-explanatory; but maybe not.
> Will be adding it.

It is indeed not too hard to figure out. But a plain english sentence is nice too :)

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

