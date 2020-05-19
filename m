Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 02D251DA454
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 00:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589926576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QXCRI04X3EzkOh3qiVSlKOQAy6u/V4SUWb3fQ9XfzyA=;
	b=Inq9UqpQoWBgqQu5JLs3Hktr2aQpFqF28i0rdO7/ydzBJw1+ak9VnIZZhdCxlItMJ6/9RQ
	iSKsWE4NeOQFRpBe5oIxJoKhn/TSPBONXfHTA8gS1rf//374ptl22X3EPr1Lzp8ejhzi4e
	P21Jg7GizLic133o/cXSI2c2Wxm8U4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-MPnTFGIoMambbGgbzeCb8Q-1; Tue, 19 May 2020 18:16:13 -0400
X-MC-Unique: MPnTFGIoMambbGgbzeCb8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9AC3107ACCD;
	Tue, 19 May 2020 22:16:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D51060BEC;
	Tue, 19 May 2020 22:16:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9604B4ED3C;
	Tue, 19 May 2020 22:15:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JMFe1Q001677 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 18:15:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60B892144B37; Tue, 19 May 2020 22:15:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10D39215688E
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:15:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 461401049882
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:15:37 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-363-GEx8RU--MfSzYbP04IWzTg-1; Tue, 19 May 2020 18:15:34 -0400
X-MC-Unique: GEx8RU--MfSzYbP04IWzTg-1
IronPort-SDR: MIO0rGgWL07jVyYNkwOcF/IrmCRf32vMQa8M0h9fApgo70+ekRpOGhPxpA86quyUE05XvCJ/0O
	DAnrw1gvGwlKMnwRXzz3ojmoJoxWldrEmydAo+FmCjfnqssHmlkfx77bNOEfJUVaAbOYeT0k8P
	buSxn2SIN5jxXWhQDoV5YWkPDX4uRhqLeoQyc/rZq16t1cmgVxMEaKwmQI2JHcWT/JCvWLhUh9
	7APCVjwkH4ysG9bJjEBaubwXnwbGAoNvGJWWMsgDvrgZnAEXCQ5I8i6KXTgxDVmdlU3rLe4UFA
	4hg=
X-IronPort-AV: E=Sophos;i="5.73,411,1583164800"; d="scan'208";a="138402154"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
	by ob1.hgst.iphmx.com with ESMTP; 20 May 2020 06:15:34 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6408.namprd04.prod.outlook.com (2603:10b6:a03:1ea::9)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23;
	Tue, 19 May 2020 22:15:32 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Tue, 19 May 2020 22:15:32 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/6] dm-zoned: return NULL if dmz_get_zone_for_reclaim()
	fails to find a zone
Thread-Index: AQHWLbWOJE+Sxm90+ESwYs+JXdpT7g==
Date: Tue, 19 May 2020 22:15:32 +0000
Message-ID: <BY5PR04MB6900DA6F738C755CA51BA5B1E7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200519081424.103318-1-hare@suse.de>
	<20200519081424.103318-2-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ed529c52-d0f4-41bf-2a85-08d7fc42259b
x-ms-traffictypediagnostic: BY5PR04MB6408:
x-microsoft-antispam-prvs: <BY5PR04MB64086D84296098576003F577E7B90@BY5PR04MB6408.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fd4eQuyiP2u7XZF1W8eL1Ff7MdqYuoDVqHjXjLPOkBZThvkbkEkIHGsp3ujFjlx9iRJugFGVoTAz0orOEJFBS+CB9ERSwczVRfjme1m8xsOnk/uvqWilS9bCNmugLDP3hhHwleFaEGlj0e96Lota91TOckFaruRRCRpl3Wk2wtlbYP4iXCfA8SSyA8xPCCD3k0paRKqXJrSz7i67kYgjiLC75W7v8G073E/Kphut+7NpFpRwxTxUI/DpFU/TDRf1bel769+Y1njy2MPIz8vgOfAwCdZScfpNX42CViTwPvqfAUi6vJoefguHVtPZ1VI2CcRRfsx9VQ++I4ULjDDQpPBOFY2yuJRrSgnL+OLTooBs5TGyVP5LDFtO3v51K9je
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(71200400001)(33656002)(66556008)(186003)(66446008)(64756008)(5660300002)(55016002)(66476007)(66946007)(4326008)(316002)(2906002)(478600001)(8676002)(8936002)(7696005)(52536014)(110136005)(26005)(76116006)(9686003)(86362001)(53546011)(6506007)(37363001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 7N5UpnQW6MeWWe3/XePjJlDjUJeQl8GGpOSGpZB7BQnhgvSu7nTTLFlCsBpUsNT163SU5Vvho69Ziyjtcyx2+75T76dQySo9j6Rh/uDvE+sk0OFVj3cLuYyV9w+X79MBQW/bNX1SISi0QcoO7Fmmj6NyOQ8GivOLOJqHDdOe/j/6iUXJcHMIgAGFrqFsl7KzlBTFEVOfffuKt2KBOPOCvPGiijWNXiv5GIQoB7GrjodClS1LkUaUqQdIaXiQDDiUJ7Ladevvt8Nx/uyJIhHTPzs0/w1Jtc3YzztWN/N7YcnDF+Zl3RSIy8R5uG3WNiBH0ld0tHx75a8LDkJ65SiaqD8YjGhHB8bbL1TDrx+25rc+U/l5VUsxKwYKyxIG4szxlMbJzTS/EWECO+HkjBPF7EIvC8WEC3LHV/B5tTyz9ZVN+DRcu8Ei4Ud7BEUFc4rrzFzLziIJ2vr4/piT5o91bZeIurpSwZlElbHSlWWQpxFjJnu8g2/SLe1JVD/DSQcZ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed529c52-d0f4-41bf-2a85-08d7fc42259b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 22:15:32.2782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ecdmak+mGhbfdy7LrRdMYqdeIYH7YqozoV1r2Y2O9Lfz/TAZv78JSyFthcTrJuxOwtxpXTFd8mOgwWGuSfIHOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6408
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04JMFe1Q001677
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/6] dm-zoned: return NULL if
 dmz_get_zone_for_reclaim() fails to find a zone
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

On 2020/05/19 17:14, Hannes Reinecke wrote:
> The only case where dmz_get_zone_for_reclaim() cannot return a zone is
> if the respective lists are empty. So we should better return a simple
> NULL value here as we really don't have an error code which would make
> sense.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 4 ++--
>  drivers/md/dm-zoned-reclaim.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index d9e256762eff..65e196cfb443 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1845,7 +1845,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
>  			return dzone;
>  	}
>  
> -	return ERR_PTR(-EBUSY);
> +	return NULL;
>  }
>  
>  /*
> @@ -1865,7 +1865,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
>  			return zone;
>  	}
>  
> -	return ERR_PTR(-EBUSY);
> +	return NULL;
>  }
>  
>  /*
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 4bfa61540b9c..77f02170cdd3 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -353,8 +353,8 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  
>  	/* Get a data zone */
>  	dzone = dmz_get_zone_for_reclaim(zmd);
> -	if (IS_ERR(dzone))
> -		return PTR_ERR(dzone);
> +	if (!dzone)
> +		return -EBUSY;
>  
>  	start = jiffies;
>  	dev = dmz_zone_to_dev(zmd, dzone);
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

