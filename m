Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8C24A20030C
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 09:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592553303;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UT0JvPJ/R3es6nav3SiCTJGayqW5Ccx+f7XBOd++rBM=;
	b=CFeVRfEmn1D7tIS92087pQuMWG1qbG9RNgG9j0Bj4oJoEaDXaTU57UpSkukNBekuJPwI0C
	cI4KCpDWE/KK9d+Vzmt5vHqIZJicc8b3nLuOKZI+3W5SNbsdZka9/dg6Bb0CccmU7gaJQy
	YEJWDXA/lXC9Pb42h109fJ617HljPAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-nVhgQCRdO2eRqkckZJ7EDw-1; Fri, 19 Jun 2020 03:55:01 -0400
X-MC-Unique: nVhgQCRdO2eRqkckZJ7EDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E055108BD0C;
	Fri, 19 Jun 2020 07:54:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C364560BF4;
	Fri, 19 Jun 2020 07:54:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBA0E833C1;
	Fri, 19 Jun 2020 07:54:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J7sphd022853 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 03:54:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C19632166BA3; Fri, 19 Jun 2020 07:54:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA0B2166B27
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:54:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F3D6858F02
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:54:49 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-473-jBqmF9CNPxuysf4cJglOHQ-1; Fri, 19 Jun 2020 03:54:44 -0400
X-MC-Unique: jBqmF9CNPxuysf4cJglOHQ-1
IronPort-SDR: voT2mdNSf3PlrEdetbStl04aOedDKtrDSXgHL8qZMth8KGX003bBfQ8n45PVz3PK20Synsh+7I
	vjYlATXFF0pE037IpyY9p7DRvY1gHILCgH/1PWIIFNj47GFHVZ8lcrFvlzhBtPwLNkprUnEAOZ
	FisNqQzCMKl5cWugzGL0MnDezc+DqP/9RYK5jqDGxGUVRE/fPFpbrW4lsK/YNwTv7/AI9JkO5Y
	NkBCVkzSKtvltYOFcRLYta6PjNGpFRdS1zkXCzEhE+So2wKAiAMU3SVxGfnGAZUQSX1hkiaCzp
	Tpc=
X-IronPort-AV: E=Sophos;i="5.75,254,1589212800"; d="scan'208";a="249595025"
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 15:54:27 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR0401MB3636.namprd04.prod.outlook.com (2603:10b6:910:91::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23;
	Fri, 19 Jun 2020 07:54:27 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Fri, 19 Jun 2020 07:54:27 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, Mike Snitzer
	<snitzer@redhat.com>
Thread-Topic: [RFC PATCH 2/2] dm: don't try to split REQ_OP_ZONE_APPEND bios
Thread-Index: AQHWRgczjPsIYl+9xUe/paWaQEGH6A==
Date: Fri, 19 Jun 2020 07:54:27 +0000
Message-ID: <CY4PR04MB37514CDC42E7F545244D66C6E7980@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
	<20200619065905.22228-3-johannes.thumshirn@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3d1434b9-65a9-4665-b176-08d81425fd85
x-ms-traffictypediagnostic: CY4PR0401MB3636:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR0401MB36369DB17886292E58A79E23E7980@CY4PR0401MB3636.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e1tg/lQc7mMZYgrCVYU5R+wfDSQfP+dva+x8SpZe7pf/U8b5QEq2hGepMojJdiIzqLarF9bz/vJXkA2D84hNqKM11DeIYBq2tO9R+NP2ivcBYEOVui61GcA0eaWFbhBs5F4PfqZkMikXirl0nHVSkwAs6cPQa0nfqt63ZNVMcrnlqXp9MYRQVR4vueIuMszPX3HeoWXfupUGn6vtdVmvCHJLXa3UOX8pVZzPOiju5LU2etLPr0qsZwGaR6rMKEWSiKawy0IDwtMNfR6Kvu8yq48Tzq+38wQ3vFTg5VzGgJGph2M/rh2XeauCnV7Q5sU1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(186003)(316002)(33656002)(8936002)(91956017)(66476007)(66946007)(110136005)(76116006)(52536014)(66446008)(6506007)(53546011)(4326008)(26005)(478600001)(54906003)(7696005)(66556008)(83380400001)(8676002)(64756008)(86362001)(2906002)(4744005)(71200400001)(5660300002)(55016002)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: NMB5wfYGuJnHKmrKwvzkIyhwTxjtnHcaTm/PfFyT2YR5x8YmSQa0ACpbkWan4L9oa9rTjCvNB746JtPyL33s5VpQ/zMDDp2RbUpECw8buslX+8vVPGUOrbRMBsRYy3B0lB2LOIcN4S2Kn0ysxvNCneaNV76rbOmgQ5mq/78aBjk3D8LXiLkDE8yHlHrXZkipDLsLBljzknP1VIkjA3QFqN3t57iRN9S9gZAyIoz1K+yWZzdUGVX+2Q0UcUmpXN8wMrzUVXlRXqpiFmHIn89jVPg0hormfI845+HSaPsZ6dqYC2QE7E7J4w6INX0Fr9C/Df9S6q+y45Nm1FITIQaEjqxqNw0ucigZWGOz/YU24HU22J9NrRULU/ZKShEm5+lMJvfSZxHt3bdvUYV2jkNw84bngcmoOM1xqDBtJgUJb9b7G3iTkHRy+Ny+gaAMA5vWU6y2wbYkWkyg1nn8k5CiXdJLd6+5j9VQwgu3LizWP0istUJlaz9zUUN+oTWSYAyc
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1434b9-65a9-4665-b176-08d81425fd85
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 07:54:27.1578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HvZyI52liZ2TcwX81fWpRN+ZHXaGw7lkYnh3YWQtUMDJV6UZAUU1wZO6n0bDnffzp1t40XyQyiVq7qURmw1deA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3636
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05J7sphd022853
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 2/2] dm: don't try to split
	REQ_OP_ZONE_APPEND bios
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

On 2020/06/19 15:59, Johannes Thumshirn wrote:
> REQ_OP_ZONE_APPEND bios cannot be split so return EIO if we can't fit it
> into one IO.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---
>  drivers/md/dm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 058c34abe9d1..c720a7e3269a 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1609,6 +1609,9 @@ static int __split_and_process_non_flush(struct clone_info *ci)
>  
>  	len = min_t(sector_t, max_io_len(ci->sector, ti), ci->sector_count);
>  
> +	if (bio_op(ci->bio) == REQ_OP_ZONE_APPEND && len < ci->sector_count)
> +		return -EIO;
> +
>  	r = __clone_and_map_data_bio(ci, ti, ci->sector, &len);
>  	if (r < 0)
>  		return r;
> 

I think this is OK. The stacked max_zone_append_sectors limit should have
prevented that to happen  in the first place I think, but better safe than sorry.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

