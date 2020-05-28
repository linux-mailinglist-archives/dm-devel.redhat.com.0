Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B9B411E54EE
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 06:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590639423;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bXT9ONn9dejuMvAxUBgeTmZWfi/KIWstnRz15JAImRo=;
	b=U9gCT8pZPNwG/t7mm2Z+SSlKuZl/Z65GaL07UT64KYgJUVRA3Wq+r0kL5uxvb/as6FJbIw
	f+jqIxRqGVll3ooVzfCKt3waEDI9oFQyK78s1aq1vQBvTcSVIRD5JH+xWkvmG9atKoj+XD
	HD3KIEu9ubkoyUTl++4hfQ8qT98bUCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-xLbjZ_ylN7-igjdPsT8W-w-1; Thu, 28 May 2020 00:17:01 -0400
X-MC-Unique: xLbjZ_ylN7-igjdPsT8W-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B05B1835B40;
	Thu, 28 May 2020 04:16:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEEA85D9EF;
	Thu, 28 May 2020 04:16:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB6FF6B4F3;
	Thu, 28 May 2020 04:16:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S4Ghu6003315 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 00:16:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 96F4D10D18D8; Thu, 28 May 2020 04:16:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91E5310D18D7
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:16:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96CB4800FFA
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:16:40 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-407-BFJpykXaOTG2oLLTqHozVg-1; Thu, 28 May 2020 00:16:36 -0400
X-MC-Unique: BFJpykXaOTG2oLLTqHozVg-1
IronPort-SDR: K0XNDCvcKRZAX7uxIeVHGUUOvI7sogY28nd7ovq6XBZA90mOEFHcbDHJrnqHg/QIqXMPEhmNgt
	QKWf80eZS0f0UU+SUjUWxcbT7eWOyo49aeG6RcWETkLWgfB8M9vHP6psMD55MnDraRs3JLo96B
	uCp/iIro3mDh7Xdi3pJW7+ejCBfnWTKsJkRkG11ibzrul7Tg/PWpprD8WR6oJiL+tmIWdQDuaI
	8Xui7gNwsAQyeDpHYCfst3iCeFEv8B6oaTjgXOnJeltKaacPlx4hbd+pNfzcGprkFTpSesLpjn
	+Gg=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="139000053"
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 12:16:35 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (10.172.142.14) by
	CY4PR04MB1143.namprd04.prod.outlook.com (10.173.188.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3045.17; Thu, 28 May 2020 04:16:33 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 04:16:33 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 15/15] dm-zoned: prefer full zones for reclaim
Thread-Index: AQHWM+9Ht0Fa6k19R0SjntMCD7Nm/6i85aoA
Date: Thu, 28 May 2020 04:16:33 +0000
Message-ID: <ba3ed1771f0034a99d9d40bf9197b8ac969c0c5a.camel@wdc.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-16-hare@suse.de>
In-Reply-To: <20200527062225.72849-16-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 27cce0f9-03b2-4c4a-34c0-08d802bde7f6
x-ms-traffictypediagnostic: CY4PR04MB1143:
x-microsoft-antispam-prvs: <CY4PR04MB114349C0B044D9FEC0808616E78E0@CY4PR04MB1143.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 84bJYcw2O07XLc8buKg2GmkSDdRUWBZ/wF5uXxaSqLcw06mPf39ceyJ3OSerPLHUOXH8CG2aFMEjLPDIMOy1JTi4LFHy1plDUziC+XE1AlRP9lBE3edBIJDDNQ9CMSonjBEa/xpBXoPSlm+N7nhIvsqJeCF2Btqh07HHHlUHfV4eJaqiaIe9c1AXnAtEA6NpC4xHCfkcDDzXp/IdpRGjs4Ze6aZqCthaqOq++wQ2gEBXyNlL/vTJNJ8RRdWcohN3sCfYUgYVo1ON5RpXtiWGO8G98WKzeauYNUxZWIJLSH/VN9SJHZX5PdgulcFlXEPz8vaw+EbaP0JRm/SNK2qIjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(36756003)(76116006)(91956017)(86362001)(5660300002)(2906002)(83380400001)(186003)(4326008)(6486002)(6506007)(110136005)(316002)(6512007)(478600001)(2616005)(71200400001)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: jQgWzLdDwgMtMvhlcjdN3NxgT7zzTqZmfIamxZRnYhr9og5RF4ji/oCb865QBnt2riixet8OMsZKcLrHPvZ81f0eghfkksrWiGXwoh+yWUbE3/APj1XCNng/4wTq01BXUsWaZA560dmt6xeWg9iSRgegs371HAf+pUdwL8m+WbE2VyqkznRWDNwhOxwLlKN1u0ylIDp9KIfGylFcXbvxEIl1DE0g7pdTbFqqeXB+y4S5Q5Y6+2mxQmLe5KAeMiORNHZo+Ms4hh+bdK8pEAcdJZwIeZX0WBIrY8f3w/F+BCxtLJWXELL+87danpF4e5AjayLU46Kexq8F2ngdwpj4f48eSxFkaygjKJkzdeas1ZU5GnORJR9+4GqBmhX0z16AEFhNy+tjVIQ3FaPQcbSx9jtXWxUSHE1Y3zWjTJeJl3q369xsHsfty5LxaNwhY0pGxYYLrya8jG54lzWZKd9L2JkABhYloSx+1Jy7bd1Yjldale2L/dH04SBcTvBjI32db9RmZBOTsu8oG+3fxEcs2CtWmZKEG762VR5Kh/JxdO1lA7kE+R3LA1cZ+YSNYqve
x-ms-exchange-transport-forked: True
Content-ID: <C64F518291975F40B80A12A1C416EF1F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cce0f9-03b2-4c4a-34c0-08d802bde7f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 04:16:33.4912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 27Abp9vbklrmX5aD1FeuNffGQkZizMI5E+UIRv+bnfZT7z0pT+Hng3XFUATuWj9L3JetNHS/N96WEbyAhgxFkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1143
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S4Ghu6003315
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 15/15] dm-zoned: prefer full zones for reclaim
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 08:22 +0200, Hannes Reinecke wrote:
> Prefer full zones when selecting the next zone for reclaim.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index b89b3d3b9ec9..f161ef4e3d3d 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1936,7 +1936,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
>  						    unsigned int idx, bool idle)
>  {
>  	struct dm_zone *dzone = NULL;
> -	struct dm_zone *zone;
> +	struct dm_zone *zone, *last = NULL;
>  	struct list_head *zone_list;
>  
>  	/* If we have cache zones select from the cache zone list */
> @@ -1953,6 +1953,13 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
>  			dzone = zone->bzone;
>  			if (dzone->dev->dev_idx != idx)
>  				continue;
> +			if (!last) {
> +				last = dzone;
> +				continue;
> +			}
> +			if (last->weight < dzone->weight)
> +				continue;
> +			dzone = last;
>  		} else
>  			dzone = zone;
>  		if (dmz_lock_zone_reclaim(dzone))

If all random/cache zones are used but none of them satisfy the
condition last->weight < dzone->weight, we may end up starving reclaim
and having user IOs accessing a new chunk wait a loooong time, if not
forever, No ? I agree that aiming at reclaim of full zones first is
more efficient, but we need a fallback to ensure forward progress.

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

