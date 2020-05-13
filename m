Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DF5CA1D127E
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 14:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589372244;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qHdlChdiWtGoGjWOteP3I1A8+gP+81af4dK1SDUx+p0=;
	b=Z9IwwilNNdIwU7G9A3m7rc5jqBMMWzGOYQYn9z67JLarMYsC3ydyUEVjvLu2p0j8s9LIks
	Hxzwgi9RkythfSEVbvfswnw/6qWOeo/vSBZcRdcB+afXgoShmOVOyDDwv12AIVXD92AqSG
	edOXTqhFIyi4GZG0NBWZt8zj/beFWXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-hMSS8Ph7OkaH9pNgVNKNdg-1; Wed, 13 May 2020 08:17:18 -0400
X-MC-Unique: hMSS8Ph7OkaH9pNgVNKNdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EE43107BF13;
	Wed, 13 May 2020 12:17:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B07D260CD3;
	Wed, 13 May 2020 12:17:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E2244CAA0;
	Wed, 13 May 2020 12:16:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DCGNam018681 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 08:16:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D801F105018E; Wed, 13 May 2020 12:16:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3AF5105018F
	for <dm-devel@redhat.com>; Wed, 13 May 2020 12:16:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04290833B4E
	for <dm-devel@redhat.com>; Wed, 13 May 2020 12:16:21 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-104-UejaS-nsMJiYAi_faKZfkw-1; Wed, 13 May 2020 08:16:16 -0400
X-MC-Unique: UejaS-nsMJiYAi_faKZfkw-1
IronPort-SDR: QEzZ8+7vriaesLA77lTCCJRiSN5vrtZ6I1MS1PaCvf5nSYDuOOg+jX/nGYah/X2BRDQpUK0pzf
	OeqfjPsoqwCaZ1Pa2oOagvWBRvcFn2JmKAkhGdPkBMGwxcBckKro3Nn2aYLsSZ02QFWBEekgcJ
	qbhsxuD5TQjYItdBDe3q3i2HUXFpqxxpkGhZpuI3spaBzrjts9tZCVGWhY9bU170cK1uBkA2ei
	1pfiF7/bO0Ebd6mI4dZK+LGNFqsmRO5j21xaB6ks1blGO7ng4P2MRckIStSa03Zhd6Eky6Lkj3
	Vt8=
X-IronPort-AV: E=Sophos;i="5.73,387,1583164800"; d="scan'208";a="246520107"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
	by ob1.hgst.iphmx.com with ESMTP; 13 May 2020 20:16:14 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6311.namprd04.prod.outlook.com (2603:10b6:a03:1f2::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.35;
	Wed, 13 May 2020 12:16:12 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Wed, 13 May 2020 12:16:12 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/2] dm-zoned: invert zone check in dmz_reset_zone()
Thread-Index: AQHWKPUwVYFtqOoR60aNoxNjtr08dQ==
Date: Wed, 13 May 2020 12:16:12 +0000
Message-ID: <BY5PR04MB69001449BE52BE3A5EF3AAA0E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200513070729.71461-1-hare@suse.de>
	<20200513070729.71461-2-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 660926be-ce4f-47a4-8f30-08d7f7376d27
x-ms-traffictypediagnostic: BY5PR04MB6311:
x-microsoft-antispam-prvs: <BY5PR04MB63119CE2A00013FFEEF6A1C7E7BF0@BY5PR04MB6311.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lu6kRhS9GYgqaz3Wfs97WNTt3uTpivK7d6p247xY1IpUN/S+fyTR47jKF4kgVqkuMHCR3hVd0Gw+OWbD9LPLLxhMafZfKZpeTIR9xvNPxMFrTIkwUpYm+y8Qm1rz+O9wCJOvAxZ+BM3I+8NIemxmJ8e6zrWTcA1NWb+9oAFP22i5i4EsEtXnx/fuU1GILGJpM6zIeJN5Ze090+ip35lIC+3k2u0CiRXu/tU7ewEBiJ+xyh9gOnfUFwAw1cYq/uLi9W6At+lfZ82fAY5xf6A92oo29lMTlOdNJnq8bguAmU9SfGjlVHIjA1J/2GUE0rn5+stIwRY12RTRk/2rcS5Dr+UVG/L/tIu7+14mfPv8LV8pL09KZtzgHUQDLWmBwEaRNi3u+I67Wp8RTIAMWqRelGEwqYpBP3/eNY20QJIVWYZxDpRfc7MP/mp3IRqAnj41gcg8n5zJwph0q+w4fGosiRUbIrdW+IZ9YTT7MK0tVunzGMuO4WlxxAL3ZQZKY3qpUfuE6gWSs5KS6+TDYvldBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(33430700001)(8676002)(8936002)(5660300002)(53546011)(6506007)(86362001)(33440700001)(26005)(2906002)(71200400001)(7696005)(55016002)(52536014)(478600001)(186003)(4326008)(66556008)(9686003)(316002)(66476007)(66946007)(76116006)(64756008)(110136005)(66446008)(33656002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: Lhpe90LWEtGgJikvF3s+6eB64KvnaO2WcyxTzIQULoW94pExcr4Nr6PAkvJC64urzewgFV929FeLSKiCZxcIXkYeZxYHt0c2Idf1h/H6eqm61HkCxUAfaL+NwUsqUWAA6MrTrJckJsA0GC36QPU/azn7jxGqAY3BtBSyzdWjissiaH1mu2TQoMI6R54LYGVCKj9u6cOXoUHxTHc40dmS3JvV8QxWOszPPMhiNqaKCbtbTEBEzpIKM5obhy291fH818+A1cnHo0d+1UPJV9QLYvuFIK2s+3ZK6NSZr9YnuXFlg2m72JlgI1wJ7Nek/F9QQSWnC9XrvdFSaHMjbvzJmSP3vLv0bAYqE0fFTjHCBjEWhzjkUZBEttdyOYlR09BbCgLCuHVT7uhYVF3KOFm3O6NdhxcYXrFi5nem3SW5QSuU0IqDa49Sl7fo1a2TrXe/N580hKSrmkrTS7RirP2r88d9iEfFaZ7vuQNHtfYl4j/lon5YSeyXeAqqNkMNMhkY
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660926be-ce4f-47a4-8f30-08d7f7376d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 12:16:12.1809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NYKC5qo5iCAFegz+uSW1wWYT+s5mieGv31PfPdBP/8ghOAvRgVVIvHwJvEfBJ8qscnGTUQLjw+gmsZa99mPmqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6311
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04DCGNam018681
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm-zoned: invert zone check in
	dmz_reset_zone()
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

On 2020/05/13 16:07, Hannes Reinecke wrote:
> Instead of excluding invalid zones we should check if the zone
> is sequential and exclude invalid states. That way we don't need
> to touch the selection when new zone states or flags are added.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index d9e256762eff..9b93d7ff1dfc 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1570,12 +1570,16 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	int ret;
>  
>  	/*
> -	 * Ignore offline zones, read only zones,
> -	 * and conventional zones.
> +	 * Only check sequential zones.

Nit: the comment would be better as:

/* Only sequential zones need reset */

> +	 */
> +	if (!dmz_is_seq(zone))
> +		return 0;
> +
> +	/*
> +	 * But ignore offline and read only zones.
>  	 */
>  	if (dmz_is_offline(zone) ||
> -	    dmz_is_readonly(zone) ||
> -	    dmz_is_rnd(zone))
> +	    dmz_is_readonly(zone))
>  		return 0;
>  
>  	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
> 

Otherwise, looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

