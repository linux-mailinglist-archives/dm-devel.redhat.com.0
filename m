Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5081999F1
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 17:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585669207;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TAOgNYcEW8EM6Z+1FhtPVC3FeqwR9NkXgKC0hGcXYZU=;
	b=fANHq99w4y7PHRcXJaoAF30L4t7KnLJflQxSjBd7LOmsqSnhQgA4AejXYDi1gqddg33ldW
	DEHzXLMexJRKuoyvEf6yYW/iW2TzjeU3jloQuYOpuHH3rS+uJ5XCpvBjzgVCwPq9f+sw6F
	6bYKceNa9Idnd29W42u7eo3l1dUlSN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-TcBCw-rsPCeb5LFq_fMq_A-1; Tue, 31 Mar 2020 11:40:04 -0400
X-MC-Unique: TcBCw-rsPCeb5LFq_fMq_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B1C4149C6;
	Tue, 31 Mar 2020 15:39:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF9C95C3FA;
	Tue, 31 Mar 2020 15:39:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23E8686C00;
	Tue, 31 Mar 2020 15:39:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VFddlW019342 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 11:39:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9352796B94; Tue, 31 Mar 2020 15:39:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C562A96B8F;
	Tue, 31 Mar 2020 15:39:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02VFdZ87005483; 
	Tue, 31 Mar 2020 10:39:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02VFdYMG005482;
	Tue, 31 Mar 2020 10:39:34 -0500
Date: Tue, 31 Mar 2020 10:39:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200331153934.GH17313@octiron.msp.redhat.com>
References: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
	<1585620055-27112-3-git-send-email-bmarzins@redhat.com>
	<5a85f7b0c9ef459ea8a7308dda4f21af8da687f5.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <5a85f7b0c9ef459ea8a7308dda4f21af8da687f5.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC Patch 2/3] libmultipath: make
 sysfs_is_multipathed able to return wwid
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Mar 31, 2020 at 01:06:01PM +0000, Martin Wilck wrote:
> On Mon, 2020-03-30 at 21:00 -0500, Benjamin Marzinski wrote:
> > @@ -342,9 +342,25 @@ bool sysfs_is_multipathed(const struct path *pp)
> >  =09=09if (nr =3D=3D sizeof(uuid) && !memcmp(uuid, "mpath-",
> > sizeof(uuid)))
> >  =09=09=09found =3D true;
> >  =09=09else if (nr < 0) {
> > -=09=09=09condlog(1, "%s: error reading from %s: %s",
> > -=09=09=09=09__func__, pathbuf, strerror(errno));
> > +=09=09=09condlog(1, "%s: error reading from %s: %m",
> > +=09=09=09=09__func__, pathbuf);
> >  =09=09}
> > +=09=09if (found && set_wwid) {
> > +=09=09=09nr =3D read(fd, pp->wwid, WWID_SIZE);
>=20
> I'd rather read the whole UUID in a single syscall (i.e. merge this
> with the previous read() that fetched the first 6 chars).

Sure.

-Ben

> Regards,
> Martin
>=20
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

