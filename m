Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F30431DA487
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 00:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589927292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fIJ8xgsnV2spsCO084nn4K3W6ulzEsVoLENWZg9ltq4=;
	b=UrfN/L0u/2D8kfbz7Z6vrQ3/favybpHmKlJGkYHkDM4CbJxvav7De7aMMM407aYDLWYmFi
	H8GrPfWtmmT3tRts4GuHaH6LZZOUFf8H6xBXN1hPDL+hSegy3XcNthLIthHxE00XRqwmEd
	mEaKjqGx6kwsUx28ffLhjnO5m213RIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-sO9f0bzuOJ2SBvZbk218vQ-1; Tue, 19 May 2020 18:28:08 -0400
X-MC-Unique: sO9f0bzuOJ2SBvZbk218vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DDF98014D7;
	Tue, 19 May 2020 22:28:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C47170873;
	Tue, 19 May 2020 22:28:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93B764ED99;
	Tue, 19 May 2020 22:28:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JMS0B5003008 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 18:28:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A100217B43C; Tue, 19 May 2020 22:28:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34AE3217B435
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:27:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AAE4185A78B
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:27:51 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-68-XHc-BufhMyK1VxTEo_lo2w-1; Tue, 19 May 2020 18:27:47 -0400
X-MC-Unique: XHc-BufhMyK1VxTEo_lo2w-1
IronPort-SDR: JReg/MTTuwIp0LlmuyoFStaJiDdqbKwg6c4QJtx1ooP3X91BOuPZLHZ9eGFOxolIK+w7v5d64t
	DNSYTxafYDYG1fgXgrzD+pPnYpfoZan4FPMLbo2doPbdXE4DS6gnvrUYyBYQGtJZI72y7bjRKB
	ICa22Lke8xj6dGCYFvvLSss3PdJsmSS7aLD0yle9KekXMyexdFv9FqZKj7qnaAVTiRC+caiPhE
	775ctOZFjDf2J3FyK8EOgIyJLEA98oxwJJtRngQjTncTF+g1gvKveFEG7yuCqWloJXjjFpVLsh
	fMg=
X-IronPort-AV: E=Sophos;i="5.73,411,1583164800"; d="scan'208";a="139511583"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
	by ob1.hgst.iphmx.com with ESMTP; 20 May 2020 06:27:46 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6616.namprd04.prod.outlook.com (2603:10b6:a03:1de::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26;
	Tue, 19 May 2020 22:27:44 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Tue, 19 May 2020 22:27:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 4/6] dm-zoned: start reclaim with sequential zones
Thread-Index: AQHWLbWOAgJPSYX3pEKE2THVZgSpWg==
Date: Tue, 19 May 2020 22:27:44 +0000
Message-ID: <BY5PR04MB6900C821E5D628F74F806D9CE7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200519081424.103318-1-hare@suse.de>
	<20200519081424.103318-5-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3eca512b-1c8c-40c5-ac9f-08d7fc43da1d
x-ms-traffictypediagnostic: BY5PR04MB6616:
x-microsoft-antispam-prvs: <BY5PR04MB6616164A0519FA1A783F8DD7E7B90@BY5PR04MB6616.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:416;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: svrhyySKHr8n84CDc5DlY6S/iLJDJSiqBFU7VdZc9fcaX0KCt4CPMQXTmc9fLhqVOWrp5wud1XbF8BntrXfzjVYeems+h6bJIrdqKRU8419+4AnECtoPsQV4YsRK2zSPWsG4Nwgy6Rpyb8o84AWUGRDkkJ2ijQfYCa0vZqeASmgmtA5ONGmcFTR1UHXmBvUDdytvOikIqbCjNKrJsonGwwub+JjzKGA0Hx2CO9FQjqCdaRFI9F1tR+TFrdhCHgp7EgBbd61MKFHRoG7nPsSyRL/4XzhVZObpZfBX8HABBVnj/VLtn4VCI4opmVI8lpV/P+IYtcG8lwu1lofeaUkuCvv/MnkKgExhWA4BLKHWpesLTHWvPYG4IaPIuAfHm9L9L30O/bH+4IJM4prhCV1HEORz+j5sWQwZyd49VINY1fX9UPdQJpaLYvVf/03+zmRu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(478600001)(110136005)(8676002)(52536014)(4326008)(6506007)(8936002)(316002)(5660300002)(53546011)(26005)(55016002)(2906002)(7696005)(33656002)(86362001)(9686003)(186003)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: rmmQfvmxfEgtePa6sRwBuHd2lV8jfL13BrrFivszUFtPzhmnGFOneOjFyiKL4JMcXnAoI6bpLyDuKVuFkPhcLjkJQVCOQgU5kUiVUQu8wVi20dLqc6vlD6ozEbsCq1IB6vyKAfiRSxXNJ3Sx+b9UnsLLp/8e2EwOxq7Utd5R9YeWhVMd65vnncaT6nApHol6KMF8Xv7e4tr3c2WLrl/KsVzuFFmq8YG619UW+Pja9Yo9ksRLDuuI6EucCF7+lEM3kNl0MlOV9m21nNjUnFTRETXsRVyvoOMazHEWpkOF0bw+aaWavA93QOi52G5z37uAIDw01w+iCsnMIaamUrPQRZRLbgt7ABZzn8MNN4t8krEj8igzyBdam1dJo8A3FA9TyollUAy5tG/O95+owwn05evc0HH4/ipJzp9NuWG8bXGjSSFeblmXQx730MjLPAgbKzU4kLnXz1+NuprOzEUs0BB4w9TaIlsIGsCSIZjRxIK04kmIBq6iXMI/9Q1wQ+tv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eca512b-1c8c-40c5-ac9f-08d7fc43da1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 22:27:44.7226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C89Gi82Y4Z9yF8VyR5Lf4Uxwxr428tPML1GdaZnAAslqSkT8l5a6iwURI+lQSEngGrtmfIx5hHGJ7Mj7pdv0sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6616
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04JMS0B5003008
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/6] dm-zoned: start reclaim with sequential
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/19 17:14, Hannes Reinecke wrote:
> Sequential zones perform better for reclaim, so start off using
> them and only use random zones as a fallback when cache zones are
> present.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-reclaim.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 1855c056d6a4..1283405bec29 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -281,15 +281,16 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	struct dm_zone *szone = NULL;
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	int ret;
> -	int alloc_flags = dmz_nr_cache_zones(zmd) ?
> -		DMZ_ALLOC_RND : DMZ_ALLOC_SEQ;
> +	int alloc_flags = DMZ_ALLOC_SEQ;
>  
> -	/* Always use sequential zones to reclaim random zones */
> -	if (dmz_is_rnd(dzone))
> -		alloc_flags = DMZ_ALLOC_SEQ;
>  	/* Get a free random or sequential zone */
>  	dmz_lock_map(zmd);
> +again:
>  	szone = dmz_alloc_zone(zmd, alloc_flags | DMZ_ALLOC_RECLAIM);
> +	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
> +		alloc_flags = DMZ_ALLOC_RND;
> +		goto again;
> +	}
>  	dmz_unlock_map(zmd);
>  	if (!szone)
>  		return -ENOSPC;
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

