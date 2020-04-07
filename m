Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C4D8B1A050E
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 04:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586228224;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MSSILtGs7sOzhQJWc+Uqf0Wibjknw7rCJc8u14NSpZA=;
	b=dMApaKtJ2fH5gQFZX6ZQMinqJrojuboWunR2eHxItis5iAYTxKMThRONyeluVIuHgPiT/9
	G/o4QHz7K811QV4UN98olgoOQA2IaXe4ypoi+yDVir/pHru0Lmte/LARRZN+dmqUfae5tN
	s2EoMi5FVYW0ICqzHrhWjXSf5pMByO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-WS8RiAQWNqOu_QVuLxi8JA-1; Mon, 06 Apr 2020 22:57:02 -0400
X-MC-Unique: WS8RiAQWNqOu_QVuLxi8JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 789DC800D4E;
	Tue,  7 Apr 2020 02:56:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDED45417F;
	Tue,  7 Apr 2020 02:56:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67B2093A62;
	Tue,  7 Apr 2020 02:56:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0372ulfd002778 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 22:56:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF2F4D016A; Tue,  7 Apr 2020 02:56:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA135D0B3C
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:56:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94DD88007A4
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:56:44 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-270-JJw8_UTSPQyYFY_Yw3MTWg-1; Mon, 06 Apr 2020 22:56:39 -0400
X-MC-Unique: JJw8_UTSPQyYFY_Yw3MTWg-1
IronPort-SDR: RGVyCbJ7ihFciaDDimXyRePg9nv7ne47x5VAh7Q/iQCJOCJ9wKeUn7z0KPGDygrmIzkrjKbqy+
	6gKGz3SoMSjMmv1211J/A7jvuo1PcIRfhfWzpF8HHQQ1kd7aMn+2ohlWN76i/mT32jekszTyF3
	Zq3tcksPo6zgIYtvGaIk5flAf/fNFu60GPQ+quxULAJacX2iYMv3uI6SEFlWncGhA44PYXmWRp
	ctt/Ynzd2Kli9yaWyPfWuAVpqVbuVIMqiUVgeVKguW1hzSQwrsugA9+nChZ2oiqM0/cIBZDmbf
	QOk=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="237059089"
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 10:56:59 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6295.namprd04.prod.outlook.com (2603:10b6:a03:1f2::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15;
	Tue, 7 Apr 2020 02:56:35 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 02:56:35 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 10/11] dm-zoned: ignore metadata zone in dmz_alloc_zone()
Thread-Index: AQHWDDjoYjZvh0h5+kS8ZumDMTyOjQ==
Date: Tue, 7 Apr 2020 02:56:35 +0000
Message-ID: <BY5PR04MB69002038261DA52ED281BC5AE7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-11-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 045ca179-f782-402e-8ed1-08d7da9f48c5
x-ms-traffictypediagnostic: BY5PR04MB6295:
x-microsoft-antispam-prvs: <BY5PR04MB6295A809D6713F7242CB5DE7E7C30@BY5PR04MB6295.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(7696005)(316002)(5660300002)(33656002)(66446008)(54906003)(64756008)(76116006)(110136005)(8936002)(81166006)(52536014)(4744005)(478600001)(6506007)(66556008)(66476007)(8676002)(53546011)(71200400001)(186003)(81156014)(2906002)(55016002)(4326008)(66946007)(26005)(86362001)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ri65mpwCZyi69ktVd3K/hzOyPhwXvKORZTL88DQnv4PLMpkW9y/GaHySFd7w5nYBYMWj0Vv/bT/MfI2vGJtuOI42ejir7JO0Akch2ux2aT8abbmUiyJ5dK3sLLRR0GsTrLoMlqeKFfHZkVMos0DNWRBr5EM3zsEZAem8yZ8cXYxTcNAprOUuKj8OJzRvRId14cKGdhI8MvL2qWjiBsEddSQ5zO9enM/WTSXV1J2Fe7JDY5XlvaRI+F6vghtQpURmXVNyRszqB5Ra2LNYv4F6+u7JnpSYAHV+cPHqMkJNK9JwIkn4Etq6yoobStZB/mhPyDGuBzFpWbU8u2GHJ11BeENmB2aNuBJnkMXvV/2b3zN069jylZFW87TRpKOLELmvFHvZ4RRHm2YZ1rqXQSnYosY+LoX1EengzIioqRlbMRiUWNPvJZ86NRpWqkd5k+Gw
x-ms-exchange-antispam-messagedata: QFpQuo1MUxjNEAxb59poFggkhyHquwoiE8ZhnimoFr4kLtJ4uNimodvhcaHQkf7Mj/DAKlkKfDp7LZVSNRlQrxoXYcCXLlBXvXTq2oIYKYdh2236wB9M/q643+IO+Fg+PC/PPgr9os6ZgOADwOg7HQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 045ca179-f782-402e-8ed1-08d7da9f48c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:56:35.0641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPkeFcgz5s6ga3cIOWaMqygvjiJvNepm1D8SCgfJWleXm1U8kQAnyvkC0tpMh+oU2HYV5LLbsCeF/anSujYATQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6295
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0372ulfd002778
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 10/11] dm-zoned: ignore metadata zone in
	dmz_alloc_zone()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/07 2:29, Hannes Reinecke wrote:
> When looking up zones in dmz_alloc_zone() we need to ignore
> metadata zones so as not to accidentally overwrite metadata.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/md/dm-zoned-metadata.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 6c52cbf290d5..e036ba4bfe57 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1910,7 +1910,13 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  		zone = NULL;
>  		goto again;
>  	}
> +	if (dmz_is_meta(zone)) {
> +		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>  
> +		dmz_dev_warn(dev, "Zone %u has metadata", dmz_id(zmd, zone));
> +		zone = NULL;
> +		goto again;
> +	}
>  	return zone;
>  }
>  
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

