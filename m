Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A82AE1D2921
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 09:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589442850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dQj3JGx6XjVVENPmxRmtxmz7ausQVtR4RJfhPFsDNkU=;
	b=EPxjjsflQNFmkWdOUJMJjCC1nL9qv8VAfp9N16hfPuA3D+GGhKBE51YWldBW9UmA/7hVoF
	B1zjJFL5g32aFKTflk42BFT8u+AqhzavvqsHqpcABXVE6/LG0N58uC66wjSMAQbnzQIkWv
	VP+LZxA22WJ8bBbS92a5j0v9hvcF80A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-Yw5eCXytMWa5QPAkok6uSQ-1; Thu, 14 May 2020 03:54:08 -0400
X-MC-Unique: Yw5eCXytMWa5QPAkok6uSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5DDA107ACCA;
	Thu, 14 May 2020 07:54:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E2635C1D3;
	Thu, 14 May 2020 07:54:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57EFD1809547;
	Thu, 14 May 2020 07:53:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E7rtgW002284 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 03:53:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF9C02157F25; Thu, 14 May 2020 07:53:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA8142166BA2
	for <dm-devel@redhat.com>; Thu, 14 May 2020 07:53:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E01F2100803D
	for <dm-devel@redhat.com>; Thu, 14 May 2020 07:53:52 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-aK3dTdGyOjWPJWuzf4PRYw-1; Thu, 14 May 2020 03:53:50 -0400
X-MC-Unique: aK3dTdGyOjWPJWuzf4PRYw-1
IronPort-SDR: KxQ0LPZYRQ1OJMouf3PRtiNeNmmVdhZ+mPvxP8wGfvfGkxUnhQ10SP+miCE9D6mZQtjWi+81x7
	T26hfbJ2rgpXqMsL65PwnswzlZWojk4Um+GLxufNcEZ1Tutym7JfKeezF3046zj/wcCSNHaUaj
	NJu7i5CmX/mpdSJwFLKHQv5PTtgQKOOQypqR3mNJte11GueTDukNaQHuyuktXkd5qaIDnHx/xY
	58C6lvmGTzsiQ+NcitxWX92xX6e1rI7vbhCFYGDHZPecV1xTeq9jEHPapQL32JWVXabsma9lHR
	uc0=
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; d="scan'208";a="240364993"
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
	by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 15:54:46 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6293.namprd04.prod.outlook.com (2603:10b6:a03:1ef::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33;
	Thu, 14 May 2020 07:53:47 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Thu, 14 May 2020 07:53:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/2] dm-zoned: remove spurious newlines from debugging
	messages
Thread-Index: AQHWKbY/hKqGBTGC0kqG6DlDycIg0w==
Date: Thu, 14 May 2020 07:53:47 +0000
Message-ID: <BY5PR04MB690056D5F089DF39BDC686A3E7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200514060929.85469-1-hare@suse.de>
	<20200514060929.85469-3-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: da8c6f16-4491-4bce-2f1e-08d7f7dbeede
x-ms-traffictypediagnostic: BY5PR04MB6293:
x-microsoft-antispam-prvs: <BY5PR04MB62935C8F12CE11FC672CDF48E7BC0@BY5PR04MB6293.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:159;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NOqGvX61xzVECIRckoNB9/N7fqPK7DALJqxAiZdtusReaoIdbfHEOuY7sbb8+3HKRTUidlvzMgGIEQzaQdwjyKkdDYY8BnqyNDk9jpc+uWNU+Xl8u3lAvu/SeHK0qDD+3LfZQHyjZZKkWr3KOySfIXL16Dzh0ay4ZeSkE9NROoOQGD2ULnLr6owUo6GaARFZ3mypbiuW21D6e9et6kXY68c43t7BtpqA4gyBnbBJQDgx2ToLNN3XeXYuOdKBZ6RkXKCOuqTHKNehg4sTXjygohMzen+MyLzqR2sRwRoU/wBK0YaTOzR8h8txja9KGv9xoDAg+AhTYW3Y2hWlHLWUTLVqWMi0qFIiH4oSOR82DBL4ohPDVS9XkR6PCeovNGoSSvXczI+d4nZ2eJM5of44nsR7uPPxG2x6TXr6mb/4SSOPDceSD0+hSdcHCXJrCNGc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(66556008)(8936002)(5660300002)(76116006)(186003)(86362001)(66946007)(478600001)(33656002)(316002)(26005)(7696005)(6506007)(66476007)(110136005)(53546011)(4326008)(55016002)(71200400001)(8676002)(15650500001)(52536014)(64756008)(66446008)(2906002)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: Fo+uT8wWfoZwt3hvhXUBlaxvHLncaDhSz7ZQYZOwBZ8X2DhsHHcDFSWnFqqci9SKyuAAdzvirYhXgSolcfkGO2KPwux0EWeJzxvCBYbzOJ3qIMA6dpS+U+GsfWTMzyR6J+/+xwvt9//exUR/hZY+TCFYR2YmBJTwwS6DcJ7ntXTbeGtW+E217nC14CvngUvQq7K6cGCb0kje9Eo+lDNiNX4ASfFw3Gle+Tt9ueA4VSMDcDiyAEtloN/2uPAi8awIuxz/movXetvfXpgyOWFP9Bvds8SGL4DRA61e5qpJvZ0bA+ddNpjsWuYXc03LinUY048tL8HExW6MLWQxP3yzDznkMep8MxKc/JlIX7/5/K8p+QUoOyXD8nIsdA9v+CAfh9ErvZsIrMN4GBqKwWr+7Lux1qlBiS9Xmey/aC5YHNN83GnGYALdHFzmJwDlNMp2AVAnQ5PpJiVTnqHXYGo2q1VKS84VEqAnfpv5G3gQDVQBRKfswCakB+HqvHKQSmpD
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8c6f16-4491-4bce-2f1e-08d7f7dbeede
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 07:53:47.1988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gn8e3QXJMKV7JVnQcXXeFY3yMnr/GIERduBeQPH51MKCeQ3SrEisurleqa80gXrMmjg7bKFFZhb7j92f7SwiFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6293
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04E7rtgW002284
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/2] dm-zoned: remove spurious newlines from
 debugging messages
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/14 15:09, Hannes Reinecke wrote:
> DMDEBUG will already add a newline to the logging messages, so we
> shouldn't be adding it to the message itself.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-reclaim.c | 4 ++--
>  drivers/md/dm-zoned-target.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 39ea0d5d4706..4bfa61540b9c 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -405,7 +405,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  
>  	ret = dmz_flush_metadata(zrc->metadata);
>  	if (ret) {
> -		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d\n",
> +		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d",
>  			dmz_metadata_label(zmd), rzone->id, ret);
>  		return ret;
>  	}
> @@ -493,7 +493,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  
>  	ret = dmz_do_reclaim(zrc);
>  	if (ret) {
> -		DMDEBUG("(%s): Reclaim error %d\n",
> +		DMDEBUG("(%s): Reclaim error %d",
>  			dmz_metadata_label(zmd), ret);
>  		if (!dmz_check_dev(zmd))
>  			return;
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index ea43f6892ced..a3d572da70ad 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -515,7 +515,7 @@ static void dmz_flush_work(struct work_struct *work)
>  	/* Flush dirty metadata blocks */
>  	ret = dmz_flush_metadata(dmz->metadata);
>  	if (ret)
> -		DMDEBUG("(%s): Metadata flush failed, rc=%d\n",
> +		DMDEBUG("(%s): Metadata flush failed, rc=%d",
>  			dmz_metadata_label(dmz->metadata), ret);
>  
>  	/* Process queued flush requests */
> @@ -679,7 +679,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  	/* Now ready to handle this BIO */
>  	ret = dmz_queue_chunk_work(dmz, bio);
>  	if (ret) {
> -		DMDEBUG("(%s): BIO op %d, can't process chunk %llu, err %i\n",
> +		DMDEBUG("(%s): BIO op %d, can't process chunk %llu, err %i",
>  			dmz_metadata_label(zmd),
>  			bio_op(bio), (u64)dmz_bio_chunk(zmd, bio),
>  			ret);
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

