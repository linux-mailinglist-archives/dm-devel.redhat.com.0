Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBCE158467
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 21:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581367828;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QZtQyIUA6bUuyNiinZEp1ffQMagWJs5reJ6TnHOQDxU=;
	b=Wgb5D/TiHmyaFnsJ+VNbeNCaYTVJz9dqkWY5XR7WTClihI1ytev58wGVgBmxnWHYifqRaZ
	ewrhnCN1LjpfdlThjUZaY6hfnareVi0cRF/3CxlHcC9vnrwOxcALJIJOX8Kn6w6ulLwE+8
	7pnsMbNHL1wmk8W+rP1LyrpI2/uVh5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-0WeuFf2xMRSiPcs_5NDppQ-1; Mon, 10 Feb 2020 15:50:25 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC30ADB64;
	Mon, 10 Feb 2020 20:50:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1731284D8A;
	Mon, 10 Feb 2020 20:50:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 330F918034EB;
	Mon, 10 Feb 2020 20:50:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AKnlS5007676 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 15:49:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B302857B4; Mon, 10 Feb 2020 20:49:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED15584D8A;
	Mon, 10 Feb 2020 20:49:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01AKnhs9024398; 
	Mon, 10 Feb 2020 14:49:43 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01AKnhdn024397;
	Mon, 10 Feb 2020 14:49:43 -0600
Date: Mon, 10 Feb 2020 14:49:42 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200210204942.GD30153@octiron.msp.redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-11-git-send-email-bmarzins@redhat.com>
	<ad6542e5dce892c1b631f661c51c2e4d107d699c.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <ad6542e5dce892c1b631f661c51c2e4d107d699c.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 0WeuFf2xMRSiPcs_5NDppQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 10, 2020 at 02:49:38PM +0000, Martin Wilck wrote:
> On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> > This adds the wildcard 'g' for multipath and path formatted printing,
> > which returns extra data from a device's vendor specific vpd
> > page.  The
> > specific vendor vpd page to use, and the vendor/product id to decode
> > it
> > can be set in the hwentry with vpd_vendor_pg and vpd_vendor_id. It
> > can
> > be configured in the devices section of multipath.conf with the
> > vpd_vendor parameter. Currently, the only devices that use this are
> > HPE
> > 3PAR arrays, to return the Volume Name.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/config.c      |  2 ++
> >  libmultipath/config.h      |  1 +
> >  libmultipath/dict.c        | 38 ++++++++++++++++++++++++++++++++++++
> >  libmultipath/discovery.c   | 40
> > +++++++++++++++++++++++++++++++++++++-
> >  libmultipath/hwtable.c     |  1 +
> >  libmultipath/print.c       | 25 ++++++++++++++++++++++++
> >  libmultipath/propsel.c     | 18 +++++++++++++++++
> >  libmultipath/propsel.h     |  1 +
> >  libmultipath/structs.h     | 15 ++++++++++++++
> >  multipath/multipath.conf.5 |  8 ++++++++
> >  10 files changed, 148 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/libmultipath/structs.h b/libmultipath/structs.h
> > index 1c32a799..6c03ee5d 100644
> > --- a/libmultipath/structs.h
> > +++ b/libmultipath/structs.h
> > @@ -21,6 +21,7 @@
> >  #define HOST_NAME_LEN=09=0916
> >  #define SLOT_NAME_SIZE=09=0940
> >  #define PRKEY_SIZE=09=0919
> > +#define VPD_DATA_SIZE=09=09128
> > =20
> >  #define SCSI_VENDOR_SIZE=099
> >  #define SCSI_PRODUCT_SIZE=0917
> > @@ -221,6 +222,18 @@ enum all_tg_pt_states {
> >  =09ALL_TG_PT_ON =3D YNU_YES,
> >  };
> > =20
> > +enum vpd_vendor_ids {
> > +=09VPD_VP_UNDEF,
> > +=09VPD_VP_HP3PAR,
> > +=09VPD_VP_ARRAY_SIZE, /* This must remain the last entry */
> > +};
> > +
> > +struct vpd_vendor_page {
> > +=09int pg;
> > +=09const char *name;
> > +};
> > +extern struct vpd_vendor_page vpd_vendor_pages[VPD_VP_ARRAY_SIZE];
> > +
> >  struct sg_id {
> >  =09int host_no;
> >  =09int channel;
> > @@ -255,6 +268,7 @@ struct path {
> >  =09char rev[PATH_REV_SIZE];
> >  =09char serial[SERIAL_SIZE];
> >  =09char tgt_node_name[NODE_NAME_SIZE];
> > +=09char vpd_data[VPD_DATA_SIZE];
>=20
>=20
> Hm, 128 more bytes per path for a rarely-used property... do we need to
> store this in "struct path"? Can't we simply fetch that information
> when someone requests it with the %g format wildcard? It doesn't matter
> much today as "struct path" is really thick already, but I have hopes
> to make it a bit leaner some day.

Well, the thought was that this information (which should help map the
path to a physical array) would most often be wanted when things were
going badly, and you might not be able to access the device.

-Ben

> Regards
> Martin
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE  Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix
> Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

