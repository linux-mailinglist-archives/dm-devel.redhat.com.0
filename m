Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 227672195B7
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 03:45:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-X4UI9bZ9M7KaQPWyf5gKFA-1; Wed, 08 Jul 2020 21:45:05 -0400
X-MC-Unique: X4UI9bZ9M7KaQPWyf5gKFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FA9B1DE2;
	Thu,  9 Jul 2020 01:44:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68AD75C1D3;
	Thu,  9 Jul 2020 01:44:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B1641809547;
	Thu,  9 Jul 2020 01:44:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0691iTKp015538 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 21:44:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8C5342AB4; Thu,  9 Jul 2020 01:44:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5126442ADC
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 01:44:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B374108C267
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 01:44:20 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-CDB_lo60NuGLaLwqvgBEqg-1; Wed, 08 Jul 2020 21:44:14 -0400
X-MC-Unique: CDB_lo60NuGLaLwqvgBEqg-1
IronPort-SDR: wg6zO6NhtXDMV/ILPdcmRIEWux7TRl3/IFCop2Fyv6U3Or1fa09zDuvttfibQEqPMMjLNpZdlh
	WhyVfPentsIjIJza4BskgqoTpij8f2/rJY4UAAqLDYF0WCI3cM+EcIHKJy/WMSznKng9+8mUX7
	z+t1Clp2STgICnTRQKDHFkbziiaCDFKcMOOfbu3drR19MoWTSMROiwDtOlDO/DJiv28ZO3gzci
	ac2ujJuej9awEDhAJXYB9fp+nkyeMg+aZQuxP4MqyUUS6+/ozVo2KIpsteTHe0ZhZUcjzJIol8
	QxA=
X-IronPort-AV: E=Sophos;i="5.75,330,1589212800"; d="scan'208";a="146293572"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
	by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2020 09:44:13 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0969.namprd04.prod.outlook.com (2603:10b6:910:55::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22;
	Thu, 9 Jul 2020 01:44:11 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3153.022;
	Thu, 9 Jul 2020 01:44:11 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/2] dm zoned: Remove set but unused variables
Thread-Index: AQHWVL2ZHl5iufUm1ESPD5uRyRQj3Q==
Date: Thu, 9 Jul 2020 01:44:11 +0000
Message-ID: <CY4PR04MB3751033CB756FB5EA04EC9F7E7640@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200708002023.738147-1-damien.lemoal@wdc.com>
	<20200708002023.738147-3-damien.lemoal@wdc.com>
	<20200708141223.GA7582@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cabf7039-cb34-4e79-2e55-08d823a99456
x-ms-traffictypediagnostic: CY4PR04MB0969:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB0969FBF0CF42C811DB0578DAE7640@CY4PR04MB0969.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 04599F3534
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rMf7GTgOPRJ1hp6uS9NNyVWlyELN6Fk1JAHC3DSnhANjNLmdZSzQushfuStCLZ/ThzDS6t+jbmOVZJg+dImG44H0enHuFl+msGBgByntnmYsAke3c4W2HlPifcLbVWLH02DJ5F3k+5lMLpfqktsbd+ZoHCw3+S43vlq8m3qMIYYb+zgV+I8Pw9P2l823SelIj3fxFX5sR5nP6qjHe85lDi/UOH6tc5cXQkJIYmJPIDsR/ZaiB8h2RtI3Dkk5FCgTTmkLCfoMV5RbRykfRP3MhtFJBzOMp8+PHg+StzPrKwWN00OWTIpftSGdcsbbMO/nl6HQrXD4eZ0awHOM2TJLdXdpfs9BPgWIwuS9fTfVaBDvE/gONbxb/zp64vHGhlyMGFIoUCpgiO+nkWefz0Hhow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(5660300002)(6916009)(6506007)(52536014)(8936002)(186003)(53546011)(7696005)(8676002)(83380400001)(86362001)(71200400001)(33656002)(64756008)(66446008)(2906002)(9686003)(54906003)(316002)(26005)(478600001)(55016002)(66476007)(66556008)(76116006)(4326008)(966005)(91956017)(66946007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 6zm8+3DwlN3lA4kFGgipCL/UjUV4R+zhWTQQCOOidI9yz/9CEg/oUhHasVxEA1KqK1z8S4C0KUqzbKZZ/MRo38UarXbSv+GF9gDWPeRi9+9M75QSjKXuWt0jU5WtNzQgNdbmXmzawWnjWtgaKrhs1nBmUntNSvu5LXfbHOBdmIWnyArpHOQ6LaI5Tb2lVZY7FxaLKlxr6egDwC/dMUgjTSsUMhrIs5lAPeh7nD8hY5Q9r9d1SXOuPGSCkoqdHX2wVgTTtw2dg6bldgBfd249G/Hq76QIuCbpoOZcWTObnkCn//fi9Rn14OV8oUozRHcPGfPIo7mYSMRvzrgCWAaqQX0PVWpa1XdCv7Vz4NbTD/+ReFIVQYl65AIMcGvxtKuGjvpyLGBDVJPQdinygNeN68GoPl7HZX+eB+Hol5J2Tj5d7R84RoJR6P+NCs/KgvGEQK7rytY5OUWLywqc9bNjem8EsT31nFwjYs7AvSyFI7P+zr91xyUWfk09w3zYyslH
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cabf7039-cb34-4e79-2e55-08d823a99456
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 01:44:11.7026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GFfJGu5sJCpv7KazF5uUIH4MDgnDqSrb57fbMwEYnqU3IyVnnWfHQ5WCfoDhQG6exmEfvj6tRfddWSxLldopiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0969
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0691iTKp015538
X-loop: dm-devel@redhat.com
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/2] dm zoned: Remove set but unused variables
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/07/09 0:14, Mike Snitzer wrote:
> On Tue, Jul 07 2020 at  8:20pm -0400,
> Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
>> In dmz_reclaim_work(), the variables nr_unmap_rnd and nr_rnd are set but
>> unused. Remove them.
>>
>> Fixes: f97809aec589 ("dm zoned: per-device reclaim")
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  drivers/md/dm-zoned-reclaim.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
>> index 9c6e264465bc..9c0ecc9568a4 100644
>> --- a/drivers/md/dm-zoned-reclaim.c
>> +++ b/drivers/md/dm-zoned-reclaim.c
>> @@ -503,7 +503,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>>  {
>>  	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
>>  	struct dmz_metadata *zmd = zrc->metadata;
>> -	unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
>> +	unsigned int p_unmap;
>>  	int ret;
>>  
>>  	if (dmz_dev_is_dying(zmd))
>> @@ -529,9 +529,6 @@ static void dmz_reclaim_work(struct work_struct *work)
>>  		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
>>  	}
>>  
>> -	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
>> -	nr_rnd = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
>> -
>>  	DMDEBUG("(%s/%u): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
>>  		dmz_metadata_label(zmd), zrc->dev_idx,
>>  		zrc->kc_throttle.throttle,
>> -- 
>> 2.26.2
>>
> 
> I picked up the same change, that was submitted earlier, for 5.8:
> https://patchwork.kernel.org/patch/11641031/

Oops. Forgot about this one...
Thanks !

> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

