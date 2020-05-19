Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7609A1DA493
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 00:29:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589927397;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mvwbLAKiWdkFhDQ+5o0gek61SA2VdqX/9Cxj1fFcjQI=;
	b=gRmLTeeTvslIWgHe7PpEzb9kG7MM8pMoh0QzPlKrpu491TsrOw5/WzgkztQQRIIBV0IF52
	Uf5HRGge2mHnQ8ShBlh0jYrBK0REtCvxcUI0pPkYnbtoS17zvTMQqgNjPQejbxUgYqsIQY
	S7gJP9xwPVMKcMq9x4wxZxfib38rqqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-m5pBGf2jP-K0klMqOG5lkA-1; Tue, 19 May 2020 18:29:55 -0400
X-MC-Unique: m5pBGf2jP-K0klMqOG5lkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 561B8100CD40;
	Tue, 19 May 2020 22:29:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F161A10027AF;
	Tue, 19 May 2020 22:29:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B42314ED99;
	Tue, 19 May 2020 22:29:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JMTk8G003112 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 18:29:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C36952017E95; Tue, 19 May 2020 22:29:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A8312029F6F
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:29:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 204B18C087A
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:29:45 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-Uy66u6XKNxyc0_amFeotOw-1; Tue, 19 May 2020 18:29:42 -0400
X-MC-Unique: Uy66u6XKNxyc0_amFeotOw-1
IronPort-SDR: 4LO4s30n4NNv3TaaNT7i/lbSKNtL1hO1oKnX6PLsDPwPXwMNr+lmWAvbzj66BkkrixkVtjjsju
	K26kVYDijbeAavy/YfzL00Jqn0WIMGzv38Q5X2CpLCPyaoNVgH4fY/2QBL28H03oK8I3yzfQKq
	sY0KQpV/kTyM/5H6TkC7NV/XdqvwZhE/ZqkDQC14tPWGh9ZvcRLfm0REqj83hsRJPiMqpgoepX
	X9TbJCVrbDFhZyNWg7wJJN3yI1/LG7tnK2ziWywZrqPwaxqdP3P7ZOc/nGlA3sv0mAWCw2QTCS
	L+M=
X-IronPort-AV: E=Sophos;i="5.73,411,1583164800"; d="scan'208";a="139511676"
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
	by ob1.hgst.iphmx.com with ESMTP; 20 May 2020 06:29:41 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6616.namprd04.prod.outlook.com (2603:10b6:a03:1de::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26;
	Tue, 19 May 2020 22:29:40 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Tue, 19 May 2020 22:29:39 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 6/6] dm-zoned: remove unused variable in dmz_do_reclaim()
Thread-Index: AQHWLbWQE1RRjCLA906bZ1pqX4bugg==
Date: Tue, 19 May 2020 22:29:39 +0000
Message-ID: <BY5PR04MB6900C0B1548D239690BE5A93E7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200519081424.103318-1-hare@suse.de>
	<20200519081424.103318-7-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 414ee017-698c-4c31-63b6-08d7fc441ebd
x-ms-traffictypediagnostic: BY5PR04MB6616:
x-microsoft-antispam-prvs: <BY5PR04MB661697BFC05B524AB3BD19E0E7B90@BY5PR04MB6616.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rJd0Y3gn3Vla4j6/qnMYcLN6zFPCFKaNVt/MtntM3UG0L/84FI6R8+KYC3iN4+aEAoI7tAATtjBQrL8aKKrACtsxaGgjVuPE4gfb/zSl09ScFR5jyyGTTW9+SZJI8vtZ1DOOUCsayS2Edf6fDuCUwO1qxVoNkPo+o7b+sqvO1/P7Zcw4CZAS1WNjE7bZxO6s6DCmLPsX0MNQuH/bigTYyI3DX8rXOK44tnpQq28ryaCxpP5ngOa3z0iT4PMDLwvDe096Qy9qFb8fu849XySIf7T7PXVgCTgnmBP7KLXPmrFDOd1raE/BLmQNfG/N/IcHtXbg4WdPZe4RJwMUtVGqfgdq6pxZPR3hkT9RSwGD1QDYOC6K7uyye5qFFi1KLuaIsIbUrSBPhsr/izAao/hZUIyST7TkZ0dQQcQAoaJLYp1y33s8fuxQjmilhKJ1NZQP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(478600001)(110136005)(8676002)(52536014)(4326008)(6506007)(8936002)(316002)(5660300002)(53546011)(26005)(55016002)(4744005)(2906002)(7696005)(33656002)(86362001)(9686003)(186003)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: but6pvH8j0mUmIK2NNeWwXl3cHKgpwbhFI1Z0O3Ci1Ui4NHSSi5QwSTui92IBafXpeiF3PJfyFs6bUPTKKEbQnPQInXRrn2bGCGi5AekYRYsKVZHJUiWf9OTxIrD3pp0/RvlR67FayNOvUW21nL0ncs9YvR46II5N05SMwOxwJQSbz/eNBEqnH/N3JyN77U0eIdL0NPw3VTd7L2T1q+hF0OWjr7Am9TDGlM4mMjkkWBkUqmVDaQZ9qGhu/qNnIuJEYnYsSsLOK2CS4MvvfaNb4/fS2ad2xkQMkhb2Qv27+joCU1rUfaCtJ4NC4EWx1ebzs/89OJc5hg/219bXc9yR2/kDaO6rQ0lrPqSiy2mFTTyYBYzNQhEjYq4NG3D+3QQIaZdNQ+Az4UFZe2/ybmBUp806XG/llbNX8FVBNuEXQh6jOqU7EzR/Vwii3H8O+XU2xsppuBaMFtcoMKHFS/1ciTTJjTzzGm09LmjsBHFsM9iwKH2Se/wrSGw5DklGR5b
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414ee017-698c-4c31-63b6-08d7fc441ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 22:29:39.8285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gUFuDJ4H1RliiZjhUTrsLvFT9Fzqe94GKHKvZf3EF5zXxguXc8TW5tEZ3wxIL26Iknq6uCQwBYCOliRS8cwuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6616
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04JMTk8G003112
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 6/6] dm-zoned: remove unused variable in
	dmz_do_reclaim()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/19 17:14, Hannes Reinecke wrote:
> 'dev' is unused, and can be removed.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-reclaim.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 3ed88581dc48..571bc1d41bab 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -366,7 +366,6 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	struct dm_zone *dzone;
>  	struct dm_zone *rzone;
> -	struct dmz_dev *dev;
>  	unsigned long start;
>  	int ret;
>  
> @@ -376,7 +375,6 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  		return -EBUSY;
>  
>  	start = jiffies;
> -	dev = dmz_zone_to_dev(zmd, dzone);
>  	if (dmz_is_cache(dzone) || dmz_is_rnd(dzone)) {
>  		if (!dmz_weight(dzone)) {
>  			/* Empty zone */
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

