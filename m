Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AA921201599
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 18:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592584223;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mTQCvEeubPtn+0a8knrmxIQ+vz7BR1LUYSIZMKiLN0s=;
	b=iQ/gA5RU1DPRYOoeV9dYn/duE4vI0Ffn8pb6gz2Y32MUaW3W10Ic/gIVdh/6BE+Yf4o+vV
	efyCrQk64sJ+TV4qapmfsWEV3IYVL5QP+XLnkkjb/dEKUGiCZmJ6N3Hzst9oPLs40u5W3+
	eH+/c38HaJhT57vIRLZHPmGtgWH9neg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-2sp1bRCiO3C7NCN8S0u7uQ-1; Fri, 19 Jun 2020 12:30:19 -0400
X-MC-Unique: 2sp1bRCiO3C7NCN8S0u7uQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE13E100CCC2;
	Fri, 19 Jun 2020 16:30:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B2D05BAC0;
	Fri, 19 Jun 2020 16:30:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E235833A3;
	Fri, 19 Jun 2020 16:30:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JGU9Bu027062 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 12:30:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 63C085D9E5; Fri, 19 Jun 2020 16:30:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6275E5D9E8;
	Fri, 19 Jun 2020 16:30:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05JGU49w031849; 
	Fri, 19 Jun 2020 11:30:04 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05JGU32X031848;
	Fri, 19 Jun 2020 11:30:03 -0500
Date: Fri, 19 Jun 2020 11:30:03 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200619163003.GO5894@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-3-git-send-email-bmarzins@redhat.com>
	<f09ec3b6537a7b7ac1ae26433e43846176f1dd48.camel@suse.com>
	<20200618231711.GM5894@octiron.msp.redhat.com>
	<a1df6c71-1427-9649-3e81-138ffcd04370@suse.de>
MIME-Version: 1.0
In-Reply-To: <a1df6c71-1427-9649-3e81-138ffcd04370@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Jun 19, 2020 at 08:32:34AM +0200, Hannes Reinecke wrote:
> >>
> >>fac68d7 is related to the famous "dm-multipath: Accept failed paths for
> >>multipath maps" patch (e.g.
> >>https://patchwork.kernel.org/patch/3368381/#7193001), which never made
> >>it upstream. SUSE kernels have shipped this patch for a long time, but
> >>we don't apply it any more in recent kernels.
> >>
> >>With this patch, The reinstate_path() failure would occur if multipathd
> >>had created a table with a "disabled" device (one which would be
> >>present in a dm map even though the actual block device didn't exist),
> >>and then tried to reinstate such a path. It sounds unlikely, but it
> >>might be possible if devices are coming and going in quick succession.
> >>In that situation, and with the "accept failed path" patch applied, a
> >>reload makes some sense, because reload (unlike reinstate) would not
> >>fail (at least not for this reason) and would actually add that just-
> >>reinstated path. OTOH, it's not likely that the reload would improve
> >>matters, either. After all, multipathd is just trying to reinstate a
> >>non-existing path. So, I'm fine with skipping the reload.
> >>
> It's actually _not_ unlikely, but a direct result of multipathd listening=
 to
> uevents.
>=20
> If you have a map with four paths, and all four of them are going down, y=
ou
> end up getting four events.
> And multipath will be processing each event _individually_, causing it to
> generate a reload sequence like:
>=20
> [a b c d]
> [b c d]
> [c d]
> [d]
> []
>=20
> Of which only the last is valid, as all the intermediate ones contain
> invalid paths.
>=20
> And _that_ is the scenario I was referring to when creating the patch.

But even still, I'm not in favor of calling ev_add_path() with the code
as it currently is. In the case you point out, it will presumably fail
when adopt_paths() calls pathinfo(). That will orphan the path, which is
good. But if the map got removed (intentionally) instead of the path,
ev_add_path() will recreate the map, which is bad. Also, it seems more
likely for a path to still exist and be usable while the multipath
device is gone (the bad case), than for the path to pass the checker
function and then disappear before mutipathd tries to reinstate it
immediately afterwards (the good case).  Further, the bad result, where
a deleted multipath device reappears, is actually a problem for users.
Having multipathd take a bit of time and pointless effort to catch up
after multiple changes happen at once doesn't effect users noticeably.

Since the checkerloop thread spends the vast majority of it's not not
checking any specific path, if a path goes away, it is most likely to be
caught by the path_offline() function. I we want to do something to
proactively deal with a path that has been removed, we should do it
there.

-Ben
=20
> Cheers,
>=20
> Hannes
> --=20
> Dr. Hannes Reinecke            Teamlead Storage & Networking
> hare@suse.de                               +49 911 74053 688
> SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
> HRB 36809 (AG N=FCrnberg), Gesch=E4ftsf=FChrer: Felix Imend=F6rffer

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

