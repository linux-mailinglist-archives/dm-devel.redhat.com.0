Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 50C09206E33
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 09:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592985011;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rSiJQebcaG2f9cyohk6XRjwc3dL2GxaH1r/Gyzpthds=;
	b=EHIGZYs9evvUe54oCTnvNalpS9v2ZEPu30trf5Il1VvmEt3UTHQ08afz+LvXuwkG1KXkXQ
	HJizYhrRgWeSKO2w0jxHoMYLikNryIkgQSA1RgRhppLkUjtdf1OzNdDOT7UXyLc/fRY0Q3
	kupVfu5ex54ragWpehri4G4Eb1Qg87U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-_8kpWtl0PY6jTNG5AKLdmw-1; Wed, 24 Jun 2020 03:50:09 -0400
X-MC-Unique: _8kpWtl0PY6jTNG5AKLdmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE6AE804001;
	Wed, 24 Jun 2020 07:50:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 213077A029;
	Wed, 24 Jun 2020 07:50:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF35A1048FD;
	Wed, 24 Jun 2020 07:49:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O7nhOs002727 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 03:49:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8B8120234B2; Wed, 24 Jun 2020 07:49:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E474B20234B0
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 07:49:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C5F7882627
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 07:49:40 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-277-PQA18nBnOWqeFcMg7rXMJw-1;
	Wed, 24 Jun 2020 03:49:35 -0400
X-MC-Unique: PQA18nBnOWqeFcMg7rXMJw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 14509AFD1;
	Wed, 24 Jun 2020 07:49:34 +0000 (UTC)
Message-ID: <ddd54050b083d930cac6c779a4d049060116d937.camel@suse.com>
From: Martin Wilck <martin.wilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Hannes Reinecke <hare@suse.de>
In-Reply-To: <20200619163003.GO5894@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-3-git-send-email-bmarzins@redhat.com>
	<f09ec3b6537a7b7ac1ae26433e43846176f1dd48.camel@suse.com>
	<20200618231711.GM5894@octiron.msp.redhat.com>
	<a1df6c71-1427-9649-3e81-138ffcd04370@suse.de>
	<20200619163003.GO5894@octiron.msp.redhat.com>
MIME-Version: 1.0
Date: Fri, 19 Jun 2020 22:03:57 +0200
User-Agent: Evolution 3.36.3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05O7nhOs002727
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/7] multipathd: fix check_path errors with
	removed map
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-06-19 at 11:30 -0500, Benjamin Marzinski wrote:
> On Fri, Jun 19, 2020 at 08:32:34AM +0200, Hannes Reinecke wrote:
> > > > fac68d7 is related to the famous "dm-multipath: Accept failed
> > > > paths for
> > > > multipath maps" patch (e.g.
> > > > https://patchwork.kernel.org/patch/3368381/#7193001), which
> > > > never made
> > > > it upstream. SUSE kernels have shipped this patch for a long
> > > > time, but
> > > > we don't apply it any more in recent kernels.
> > > >=20
> > > > With this patch, The reinstate_path() failure would occur if
> > > > multipathd
> > > > had created a table with a "disabled" device (one which would
> > > > be
> > > > present in a dm map even though the actual block device didn't
> > > > exist),
> > > > and then tried to reinstate such a path. It sounds unlikely,
> > > > but it
> > > > might be possible if devices are coming and going in quick
> > > > succession.
> > > > In that situation, and with the "accept failed path" patch
> > > > applied, a
> > > > reload makes some sense, because reload (unlike reinstate)
> > > > would not
> > > > fail (at least not for this reason) and would actually add that
> > > > just-
> > > > reinstated path. OTOH, it's not likely that the reload would
> > > > improve
> > > > matters, either. After all, multipathd is just trying to
> > > > reinstate a
> > > > non-existing path. So, I'm fine with skipping the reload.
> > > >=20
> > It's actually _not_ unlikely, but a direct result of multipathd
> > listening to
> > uevents.
> >=20
> > If you have a map with four paths, and all four of them are going
> > down, you
> > end up getting four events.
> > And multipath will be processing each event _individually_, causing
> > it to
> > generate a reload sequence like:
> >=20
> > [a b c d]
> > [b c d]
> > [c d]
> > [d]
> > []
> >=20
> > Of which only the last is valid, as all the intermediate ones
> > contain
> > invalid paths.
> >=20
> > And _that_ is the scenario I was referring to when creating the
> > patch.
>=20
> But even still, I'm not in favor of calling ev_add_path() with the
> code
> as it currently is. In the case you point out, it will presumably
> fail
> when adopt_paths() calls pathinfo(). That will orphan the path, which
> is
> good. But if the map got removed (intentionally) instead of the path,
> ev_add_path() will recreate the map, which is bad. Also, it seems
> more
> likely for a path to still exist and be usable while the multipath
> device is gone (the bad case), than for the path to pass the checker
> function and then disappear before mutipathd tries to reinstate it
> immediately afterwards (the good case).  Further, the bad result,
> where
> a deleted multipath device reappears, is actually a problem for
> users.
> Having multipathd take a bit of time and pointless effort to catch up
> after multiple changes happen at once doesn't effect users
> noticeably.
>=20
> Since the checkerloop thread spends the vast majority of it's not not
> checking any specific path, if a path goes away, it is most likely to
> be
> caught by the path_offline() function. I we want to do something to
> proactively deal with a path that has been removed, we should do it

Hannes and I discussed about this, and he agreed that calling
ev_add_path() in the situation at hand wasn't helpful. Hence his
suggestion with pp->mpp that we discussed in the other sub-thread.

Regards,
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

