Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6D596158B16
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 09:12:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581408728;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xdOjHf5ugVA7vO+suxpoeUgsaM0gafitaAwu9WaVEvM=;
	b=bk3QtcjBpibj7lOC5UMG6mjuF5I4LxmUqzpFeET6tiM6c70Ym2G/VB7ZbSyw3Ppqn06YbK
	W+2J1EyaXc2/iKHxtFePg44HagIx/hUEVqrvnHfUWG1NMrvTUzz+Um1jHomcevNwEp7kgP
	PDAvwLSfIuJTPOpjeXK5BilKiTg15Lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-CA3SoPU5MLe_oWdnklRWcA-1; Tue, 11 Feb 2020 03:12:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43CAB107ACC4;
	Tue, 11 Feb 2020 08:11:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B376260BF4;
	Tue, 11 Feb 2020 08:11:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B87C866C6;
	Tue, 11 Feb 2020 08:11:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B88Qt9006111 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 03:08:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C3DAC206320B; Tue, 11 Feb 2020 08:08:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF2AA2026D67
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:08:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6338D80418A
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:08:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-216-ekR48km8OSCDgEqBGgynCw-1;
	Tue, 11 Feb 2020 03:08:20 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 582FBACB1;
	Tue, 11 Feb 2020 08:08:19 +0000 (UTC)
Message-ID: <2f1e42b45a985db8a1231698609682d1a4bfcbea.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 11 Feb 2020 09:09:48 +0100
In-Reply-To: <20200210204942.GD30153@octiron.msp.redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-11-git-send-email-bmarzins@redhat.com>
	<ad6542e5dce892c1b631f661c51c2e4d107d699c.camel@suse.com>
	<20200210204942.GD30153@octiron.msp.redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: ekR48km8OSCDgEqBGgynCw-1
X-MC-Unique: CA3SoPU5MLe_oWdnklRWcA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B88Qt9006111
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-10 at 14:49 -0600, Benjamin Marzinski wrote:
> On Mon, Feb 10, 2020 at 02:49:38PM +0000, Martin Wilck wrote:
> > On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> > > This adds the wildcard 'g' for multipath and path formatted
> > > printing,
> > > which returns extra data from a device's vendor specific vpd
> > > page.  The
> > > specific vendor vpd page to use, and the vendor/product id to
> > > decode
> > > it
> > > can be set in the hwentry with vpd_vendor_pg and vpd_vendor_id.
> > > It
> > > can
> > > be configured in the devices section of multipath.conf with the
> > > vpd_vendor parameter. Currently, the only devices that use this
> > > are
> > > HPE
> > > 3PAR arrays, to return the Volume Name.
> > > 
> > > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > > ---
> > >  libmultipath/config.c      |  2 ++
> > >  libmultipath/config.h      |  1 +
> > >  libmultipath/dict.c        | 38
> > > ++++++++++++++++++++++++++++++++++++
> > >  libmultipath/discovery.c   | 40
> > > +++++++++++++++++++++++++++++++++++++-
> > >  libmultipath/hwtable.c     |  1 +
> > >  libmultipath/print.c       | 25 ++++++++++++++++++++++++
> > >  libmultipath/propsel.c     | 18 +++++++++++++++++
> > >  libmultipath/propsel.h     |  1 +
> > >  libmultipath/structs.h     | 15 ++++++++++++++
> > >  multipath/multipath.conf.5 |  8 ++++++++
> > >  10 files changed, 148 insertions(+), 1 deletion(-)
> > > 
> > >  struct sg_id {
> > >  	int host_no;
> > >  	int channel;
> > > @@ -255,6 +268,7 @@ struct path {
> > >  	char rev[PATH_REV_SIZE];
> > >  	char serial[SERIAL_SIZE];
> > >  	char tgt_node_name[NODE_NAME_SIZE];
> > > +	char vpd_data[VPD_DATA_SIZE];
> > 
> > Hm, 128 more bytes per path for a rarely-used property... do we
> > need to
> > store this in "struct path"? Can't we simply fetch that information
> > when someone requests it with the %g format wildcard? It doesn't
> > matter
> > much today as "struct path" is really thick already, but I have
> > hopes
> > to make it a bit leaner some day.
> 
> Well, the thought was that this information (which should help map
> the
> path to a physical array) would most often be wanted when things were
> going badly, and you might not be able to access the device.

Point taken. How about using a pointer? That would be only 8 extra
bytes for those cases where the field was unused.
Call me old-fashioned, I've grown up in a world where 1000x128 bytes
mattered.

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

