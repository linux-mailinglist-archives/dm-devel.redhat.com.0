Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 023CB157DDE
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 15:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581346462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UCxoGGUM9cUZdddjEwju9VWlhbXritXY06zF9hUnc/Q=;
	b=bAnbvHswDvqWbzW3PZ4Zn3r540XilPen3jdZ29PekbqSidyTmYFkVwhronbPUPQ156pKkF
	S5yW0EDeFYQrusKS1J96PKSZUEupuVlHE+Eao80vZK5q9VQQHsLFOaYulyu6+knbvv+spz
	vYUbzq3PNIoEUTdCaKZqXgY4O94IaCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-xOMsTdjvMz6oXblgHyAZxg-1; Mon, 10 Feb 2020 09:54:17 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EABA8800D4E;
	Mon, 10 Feb 2020 14:54:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7007388;
	Mon, 10 Feb 2020 14:54:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3B31183269C;
	Mon, 10 Feb 2020 14:54:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AEpQe5019220 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 09:51:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB8149D41; Mon, 10 Feb 2020 14:51:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D46CEA3179
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 14:51:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 612A81019284
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 14:51:22 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-27-DGbVL_H2MfmL9g6udamJXg-1;
	Mon, 10 Feb 2020 09:51:20 -0500
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Mon, 10 Feb 2020 14:50:33 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 10 Feb 2020 14:49:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Mon, 10 Feb 2020 14:49:39 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1147.namprd18.prod.outlook.com (10.168.115.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.21; Mon, 10 Feb 2020 14:49:38 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86%12]) with mapi id 15.20.2707.028;
	Mon, 10 Feb 2020 14:49:38 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 10/17] libmultipath: add code to get vendor specific
	vpd data
Thread-Index: AQHV3FZalhOjjtnFIEGy/9H7I8pY06gUimCA
Date: Mon, 10 Feb 2020 14:49:38 +0000
Message-ID: <ad6542e5dce892c1b631f661c51c2e4d107d699c.camel@suse.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-11-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-11-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.218.227.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 115ccb89-057e-4a5d-1dcc-08d7ae387450
x-ms-traffictypediagnostic: DM5PR18MB1147:
x-microsoft-antispam-prvs: <DM5PR18MB1147FCD6AF7ED03FB4C3A300FC190@DM5PR18MB1147.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(189003)(199004)(81166006)(81156014)(8676002)(186003)(316002)(6512007)(4326008)(2616005)(71200400001)(86362001)(6506007)(66574012)(36756003)(8936002)(6486002)(5660300002)(110136005)(478600001)(66556008)(66946007)(91956017)(76116006)(66476007)(66446008)(2906002)(26005)(64756008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1147;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rEj1FAaNi9fOPrgsFWnKOYe4QFjPgcuaRn6kAOK2eDWWOkViSNuYgw4kAZ9CvekayFqffTd79yUoxKCcjf6yKTFhB2AmNc21JitbrX6p3OADt09IArlIyQWbU/U3EIaMrEdATNmZLk5a//2OSOA8TLgnOwt2zKXgvmN4jlGbUqU2Xfa3p8LGZ/wa2ownC7oyOrhjqUbBOg1vO+82uV8HrEmUYHJgjS1Up7jnhHw/MnoVObmIeY/PdsYm6AcCuiJVV08zNQEYFm30RFJZQph3qrsFHZ6BKQRsI0sRaFBmmjQCvjFNBaDAD+z0q/enuBRfNE8+p7ifBZK9qoMWvv/cEahU2YFsml00XJj+YAWjLyPnf5ijDgXu9TIEgoSZd4QkRMxxdhZNl5ZcvO5CkH83GZnUhUftqo8OJiMWW3Mj/d4S1E5GA6WR+BRcJFtVULCR
x-ms-exchange-antispam-messagedata: NGLU1K8FjWXQQ+X5RKUofQLu3En3Cz8Xb5JldzmqUQSVAcCmR0yCpoDEdq9X/dKFwzP+mk9RE8bq1tRwHqxwZOoorCvjqenAK/qLVfGzJD1/PZrzs9PUwonVi6f5Z85pQlBUY9wPojrzTmCAJROAPA==
x-ms-exchange-transport-forked: True
Content-ID: <BA64D792C6021E4EA593FC160E4B3FB9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 115ccb89-057e-4a5d-1dcc-08d7ae387450
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 14:49:38.7194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3Dt8ZCtQFn7RMqJ5zOTb1lSKSVFvIpc+MPaIrVhzQS1YVY4RFmIOqmeBDqiwiR4VlAlZr95EbTev5SQ3BkWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1147
X-OriginatorOrg: suse.com
X-MC-Unique: DGbVL_H2MfmL9g6udamJXg-1
X-MC-Unique: xOMsTdjvMz6oXblgHyAZxg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01AEpQe5019220
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 10/17] libmultipath: add code to get
 vendor specific vpd data
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> This adds the wildcard 'g' for multipath and path formatted printing,
> which returns extra data from a device's vendor specific vpd
> page.  The
> specific vendor vpd page to use, and the vendor/product id to decode
> it
> can be set in the hwentry with vpd_vendor_pg and vpd_vendor_id. It
> can
> be configured in the devices section of multipath.conf with the
> vpd_vendor parameter. Currently, the only devices that use this are
> HPE
> 3PAR arrays, to return the Volume Name.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/config.c      |  2 ++
>  libmultipath/config.h      |  1 +
>  libmultipath/dict.c        | 38 ++++++++++++++++++++++++++++++++++++
>  libmultipath/discovery.c   | 40
> +++++++++++++++++++++++++++++++++++++-
>  libmultipath/hwtable.c     |  1 +
>  libmultipath/print.c       | 25 ++++++++++++++++++++++++
>  libmultipath/propsel.c     | 18 +++++++++++++++++
>  libmultipath/propsel.h     |  1 +
>  libmultipath/structs.h     | 15 ++++++++++++++
>  multipath/multipath.conf.5 |  8 ++++++++
>  10 files changed, 148 insertions(+), 1 deletion(-)
>=20
> diff --git a/libmultipath/structs.h b/libmultipath/structs.h
> index 1c32a799..6c03ee5d 100644
> --- a/libmultipath/structs.h
> +++ b/libmultipath/structs.h
> @@ -21,6 +21,7 @@
>  #define HOST_NAME_LEN=09=0916
>  #define SLOT_NAME_SIZE=09=0940
>  #define PRKEY_SIZE=09=0919
> +#define VPD_DATA_SIZE=09=09128
> =20
>  #define SCSI_VENDOR_SIZE=099
>  #define SCSI_PRODUCT_SIZE=0917
> @@ -221,6 +222,18 @@ enum all_tg_pt_states {
>  =09ALL_TG_PT_ON =3D YNU_YES,
>  };
> =20
> +enum vpd_vendor_ids {
> +=09VPD_VP_UNDEF,
> +=09VPD_VP_HP3PAR,
> +=09VPD_VP_ARRAY_SIZE, /* This must remain the last entry */
> +};
> +
> +struct vpd_vendor_page {
> +=09int pg;
> +=09const char *name;
> +};
> +extern struct vpd_vendor_page vpd_vendor_pages[VPD_VP_ARRAY_SIZE];
> +
>  struct sg_id {
>  =09int host_no;
>  =09int channel;
> @@ -255,6 +268,7 @@ struct path {
>  =09char rev[PATH_REV_SIZE];
>  =09char serial[SERIAL_SIZE];
>  =09char tgt_node_name[NODE_NAME_SIZE];
> +=09char vpd_data[VPD_DATA_SIZE];


Hm, 128 more bytes per path for a rarely-used property... do we need to
store this in "struct path"? Can't we simply fetch that information
when someone requests it with the %g format wildcard? It doesn't matter
much today as "struct path" is really thick already, but I have hopes
to make it a bit leaner some day.

Regards
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

