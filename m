Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 95EB02416EC
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 09:10:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-lnIAqWhBN5CvC--FxiavMw-1; Tue, 11 Aug 2020 03:09:06 -0400
X-MC-Unique: lnIAqWhBN5CvC--FxiavMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5529A79EC3;
	Tue, 11 Aug 2020 07:09:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33BE55F9DC;
	Tue, 11 Aug 2020 07:09:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9908A552B;
	Tue, 11 Aug 2020 07:09:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ALRWMb025262 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 17:27:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E9936208DD80; Mon, 10 Aug 2020 21:27:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4426208DD81
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 21:27:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F5798007A4
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 21:27:29 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam07on2063.outbound.protection.outlook.com [40.107.95.63])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-478-b-oLAqAyNeq4bosfEEZl3g-1; Mon, 10 Aug 2020 17:27:24 -0400
X-MC-Unique: b-oLAqAyNeq4bosfEEZl3g-1
Received: from DM6PR06MB5276.namprd06.prod.outlook.com (2603:10b6:5:10e::20)
	by DM5PR06MB2666.namprd06.prod.outlook.com (2603:10b6:3:41::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18;
	Mon, 10 Aug 2020 21:27:22 +0000
Received: from DM6PR06MB5276.namprd06.prod.outlook.com
	([fe80::7427:ce9a:afeb:458e]) by
	DM6PR06MB5276.namprd06.prod.outlook.com
	([fe80::7427:ce9a:afeb:458e%6]) with mapi id 15.20.3261.024;
	Mon, 10 Aug 2020 21:27:22 +0000
From: "Schremmer, Steven" <Steve.Schremmer@netapp.com>
To: Martin Wilck <mwilck@suse.com>, Xose Vazquez Perez
	<xose.vazquez@gmail.com>, Benjamin Marzinski <bmarzins@redhat.com>, Hannes
	Reinecke <hare@suse.de>, DM-DEVEL ML <dm-devel@redhat.com>
Thread-Topic: [PATCH RFC] multipath-tools: *untested* use sysfs prio also for
	arrays with dual implicit/explicit alua support
Thread-Index: AQHWa20v63wiA4tdFUik0IOQtfAre6kx4S+g
Date: Mon, 10 Aug 2020 21:27:21 +0000
Message-ID: <DM6PR06MB5276C43B9BA875DA4B27497F8C440@DM6PR06MB5276.namprd06.prod.outlook.com>
References: <acc2f009-c4b8-0c09-c77c-9400aac38cb1@gmail.com>
	<db83c4595e4e494d95c80825b1a66dfb77e14690.camel@suse.com>
In-Reply-To: <db83c4595e4e494d95c80825b1a66dfb77e14690.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [98.187.40.65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6eee360-4a6f-498a-4660-08d83d742b17
x-ms-traffictypediagnostic: DM5PR06MB2666:
x-microsoft-antispam-prvs: <DM5PR06MB2666186DE3F8086DEF721ED38C440@DM5PR06MB2666.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1rL6CMc1gMxY+7m/XatKcH1oj7IWnJNVVoGyl+XXcDZ0P4IoqvMKjJ9DhvBGTob97KFJBnsLYz2gsKFberlIxYlFdKc2tFTmfLMVMBNwNdgfsVK4zYrwj5UyVjOaFWCamIEzpkaq7hzzuU211kdvgrcU/ZI1ejwalZ8Q5QrI8ipjMQ32AvBu8KuOxnpa9GxarF7XMOlDzzD6QBBierlleOe6bH+6oJviidJI6fxroxNf6NEbDNxnGGQkl+e+piS/zfEFM0vIxh7FQR2LM0n2jmfblkQCOwqWoedPMlS9oeAb/kZohv3VPlkc+lIWLEMh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM6PR06MB5276.namprd06.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(8936002)(33656002)(478600001)(55016002)(9686003)(110136005)(76116006)(66556008)(64756008)(66446008)(66476007)(316002)(66946007)(7696005)(6506007)(53546011)(71200400001)(186003)(26005)(52536014)(8676002)(2906002)(86362001)(5660300002)(83380400001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: 8ow1LtXt6FRoI1upMs6UqkATRZCGYA8UOd/bnI2e/LiUWHmQ7p3aL3LZiyasffLh9xgV8jlP22m5orbOejVEnr4CoLGgnD2HOCQx1nCxaF1zl8zQF0bDv+Z5IBdLG1mQNlrcGi4DK+1QqeV2KnEr4n6pSTS72fyeTcYsIzfA4HLZRzyLTdpwPwK/ARCpVHIzyZ662SPxBmwMQ35R69Lbq8Ep2GnjrQlBF+oX4XfQcgXLkX53bNqWxpaLw7096fZ9Uy5u6tYztmGGI3xKIARoBhvUZiMYvOGQNh7pyOjYkA8sdNbXvChhcZdPqzyOPg2m4SF5DBU2N9lhwmBwOvFH3oIs7oIYdzkg206ujPD9qAHNUEJqQAfdMLqCF3oPd10T1bOQj9OiUWgGEhmvj6VFBlwuxPVPc5yP6CH2TC1+QgRIfjNv2sj64jI5FMYNKD/UMaLFGnOJKm6gD8LP8JajdPJz+u2XDHcfFlgd/1dN2qj5otY4jvBIATsP2aOAiaC1bB6b9OZx+ZjwreUROS74G8t4VrQbYDVTdW0KI2g5HvgcKVgVNTjzXwMXTUHEJY2S/xv7avh6+T5/sAc1wj6WQAw0V65a5E5zUI2l6VcMlg7H773DsoKi0hB4ebUxYCDAudgK6nEBsl8wOBWYoaZfuA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR06MB5276.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6eee360-4a6f-498a-4660-08d83d742b17
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 21:27:22.0511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U26na6UKBQSo0F05tGv/6oeJ/B+tjKO3G6F5Y/RXWE4QxaHfGQQrtAWrT00F1hjnYOZp3UF7u5dcY7fLj/Vaow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR06MB2666
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07ALRWMb025262
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 11 Aug 2020 03:08:22 -0400
Subject: Re: [dm-devel] [PATCH RFC] multipath-tools: *untested* use sysfs
 prio also for arrays with dual implicit/explicit alua support
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

An RDAC array configured to run with Linux DM-MP should never report that it supports implicit and explicit ALUA support. If the array is configured to run with scsi_dh_rdac then it reports TPGS=0 (none) and should use rdac prio. The more modern configuration is to report TPGS=01b (implicit) and use scsi_dh_alua and alua prio.

Thanks,
Steve

> From: Martin Wilck <mwilck@suse.com>
> Sent: Wednesday, August 5, 2020 4:13 PM
> To: Xose Vazquez Perez <xose.vazquez@gmail.com>; Benjamin Marzinski <bmarzins@redhat.com>; Hannes Reinecke <hare@suse.de>;
> DM-DEVEL ML <dm-devel@redhat.com>
> Cc: Schremmer, Steven <Steve.Schremmer@netapp.com>
> Subject: Re: [PATCH RFC] multipath-tools: *untested* use sysfs prio also for arrays with dual implicit/explicit alua support
> 
> Hi Xose,
> 
> do you have a specific use case where this helps / changes matters?
> 
> The idea of the current code is to use PRIO_SYSFS always, except for
> RDAC arrays with implicit ALUA, where periodic RTPGs are necessary (see
> 7e2f46d). This patch would change matters only for RDAC arrays which
> advertise both explicit and implicit ALUA support.
> 
> Maybe Steven can clarify if such RDAC arrays exist, and whether we
> should use PRIO_SYSFS or PRIO_ALUA for them.
> 
> Martin
> 
> 
> On Sat, 2020-07-25 at 00:34 +0200, Xose Vazquez Perez wrote:
> > Cc: Martin Wilck <mwilck@suse.com>
> > Cc: Benjamin Marzinski <bmarzins@redhat.com>
> > Cc: Hannes Reinecke <hare@suse.de>
> > Cc: DM-DEVEL ML <dm-devel@redhat.com>
> > Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> > ---
> > diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
> > index 897e48ca..5a82234f 100644
> > --- a/libmultipath/propsel.c
> > +++ b/libmultipath/propsel.c
> > @@ -595,7 +595,7 @@ detect_prio(struct config *conf, struct path *
> > pp)
> >               tpgs = path_get_tpgs(pp);
> >               if (tpgs == TPGS_NONE)
> >                       return;
> > -             if ((tpgs == TPGS_EXPLICIT || !check_rdac(pp)) &&
> > +             if ((tpgs == TPGS_EXPLICIT || tpgs == TPGS_BOTH ||
> > !check_rdac(pp)) &&
> >                   sysfs_get_asymmetric_access_state(pp, buff, 512) >=
> > 0)
> >                       default_prio = PRIO_SYSFS;
> >               else
> >
> > In short:
> >
> > diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
> > index 897e48ca..a9609a01 100644
> > --- a/libmultipath/propsel.c
> > +++ b/libmultipath/propsel.c
> > @@ -595,7 +595,7 @@ detect_prio(struct config *conf, struct path *
> > pp)
> >               tpgs = path_get_tpgs(pp);
> >               if (tpgs == TPGS_NONE)
> >                       return;
> > -             if ((tpgs == TPGS_EXPLICIT || !check_rdac(pp)) &&
> > +             if ((tpgs != TPGS_IMPLICIT || !check_rdac(pp)) &&
> >                   sysfs_get_asymmetric_access_state(pp, buff, 512) >=
> > 0)
> >                       default_prio = PRIO_SYSFS;
> >               else
> >
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

