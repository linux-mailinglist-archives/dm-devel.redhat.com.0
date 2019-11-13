Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 52F87FB2DF
	for <lists+dm-devel@lfdr.de>; Wed, 13 Nov 2019 15:51:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573656685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PDltdGUz+tBKRkkRu9jDA8QTeDOWbI9IR2OL5EgOlmc=;
	b=aIVCl+pgvATFPvMHSsuIwyPFKGV+a5DbXCrpW9TBorwEHoXJMo4isdEqV22H326Ljj1H0t
	RP02TP4ORqkZAayvUrBDu7TdSLYizINTNKF879tDNNs7xCgBaYy/8IdYCXOlc3anB/+BHm
	Spsk/bF4k51Z83LHSrAX0i6R8vMRa1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-eJ8wRLUNP5mJKiSSuJpqKw-1; Wed, 13 Nov 2019 09:51:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A9CB13324D;
	Wed, 13 Nov 2019 14:51:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E6B650FCE;
	Wed, 13 Nov 2019 14:51:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D7E64BB78;
	Wed, 13 Nov 2019 14:50:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAD61TN3017006 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 01:01:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F13C010246F6; Wed, 13 Nov 2019 06:01:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ovpn-116-229.phx2.redhat.com (ovpn-116-229.phx2.redhat.com
	[10.3.116.229])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7730C101E3CB;
	Wed, 13 Nov 2019 06:01:22 +0000 (UTC)
Message-ID: <048d9e5ea9ea9cebe18aa96d59bd0a67b3429529.camel@redhat.com>
From: Scott Wood <swood@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>, Mikulas Patocka
	<mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <a6f588d3-2403-d50a-70a1-ed644082cc83@arrikto.com>
References: <alpine.LRH.2.02.1911110811060.28408@file01.intranet.prod.int.rdu2.redhat.com>
	<c9a772e9-e305-cf0b-1155-fb19bdb84e55@arrikto.com>
	<20191112011444.GA32220@redhat.com>
	<alpine.LRH.2.02.1911120240020.25757@file01.intranet.prod.int.rdu2.redhat.com>
	<a6f588d3-2403-d50a-70a1-ed644082cc83@arrikto.com>
Organization: Red Hat
MIME-Version: 1.0
Date: Wed, 13 Nov 2019 00:01:06 -0600
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 13 Nov 2019 09:50:48 -0500
Cc: linux-rt-users@vger.kernel.org, Daniel Wagner <dwagner@suse.de>,
	Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	tglx@linutronix.de, Sebastian
Subject: Re: [dm-devel] [PATCH 1/2] dm-snapshot: fix crash with the realtime
	kernel
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: eJ8wRLUNP5mJKiSSuJpqKw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-11-12 at 13:45 +0200, Nikos Tsironis wrote:
> On 11/12/19 9:50 AM, Mikulas Patocka wrote:
> >=20
> > On Mon, 11 Nov 2019, Mike Snitzer wrote:
> >=20
> > > On Mon, Nov 11 2019 at 11:37am -0500,
> > > Nikos Tsironis <ntsironis@arrikto.com> wrote:
> > >=20
> > > > On 11/11/19 3:59 PM, Mikulas Patocka wrote:
> > > > > Snapshot doesn't work with realtime kernels since the commit
> > > > > f79ae415b64c.
> > > > > hlist_bl is implemented as a raw spinlock and the code takes two
> > > > > non-raw
> > > > > spinlocks while holding hlist_bl (non-raw spinlocks are blocking
> > > > > mutexes
> > > > > in the realtime kernel, so they couldn't be taken inside a raw
> > > > > spinlock).
> > > > >=20
> > > > > This patch fixes the problem by using non-raw spinlock
> > > > > exception_table_lock instead of the hlist_bl lock.
> > > > >=20
> > > > > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > > > > Fixes: f79ae415b64c ("dm snapshot: Make exception tables
> > > > > scalable")
> > > > >=20
> > > >=20
> > > > Hi Mikulas,
> > > >=20
> > > > I wasn't aware that hlist_bl is implemented as a raw spinlock in th=
e
> > > > real time kernel. I would expect it to be a standard non-raw
> > > > spinlock,
> > > > so everything works as expected. But, after digging further in the
> > > > real
> > > > time tree, I found commit ad7675b15fd87f1 ("list_bl: Make list head
> > > > locking RT safe") which suggests that such a conversion would break
> > > > other parts of the kernel.
> > >=20
> > > Right, the proper fix is to update list_bl to work on realtime (which
> > > I
> > > assume the referenced commit does).  I do not want to take this
> > > dm-snapshot specific workaround that open-codes what should be done
> > > within hlist_{bl_lock,unlock}, etc.
> >=20
> > If we change list_bl to use non-raw spinlock, it fails in dentry lookup=
=20
> > code. The dentry code takes a seqlock (which is implemented as preempt=
=20
> > disable in the realtime kernel) and then takes a list_bl lock.
> >=20
> > This is wrong from the real-time perspective (the chain in the hash
> > could=20
> > be arbitrarily long, so using non-raw spinlock could cause unbounded=20
> > wait), however we can't do anything with it.
> >=20
> > I think that fixing dm-snapshot is way easier than fixing the dentry
> > code.=20
> > If you have an idea how to fix the dentry code, tell us.
>=20
> I too think that it would be better to fix list_bl. dm-snapshot isn't
> really broken. One should be able to acquire a spinlock while holding
> another spinlock.

That's not universally true -- even in the absence of RT there are nesting
considerations.  But it would probably be good if raw locks weren't hidden
inside other locking primitives without making it clear (ideally in the
function names) that it's a raw lock.

> Moreover, apart from dm-snapshot, anyone ever using list_bl is at risk
> of breaking the realtime kernel, if he or she is not aware of that
> particular limitation of list_bl's implementation in the realtime tree.

In particular the non-rcu variant seems inherently bad unless you protect
traversal with some other lock (in which case why use bl at all?).  Maybe
fully separate the rcu version of list_bl and keep using raw locks there
(with the name clearly indicating so), with the side benefit that
accidentally mixing rcu and non-rcu operations on the same list would becom=
e
a build error, and convert the non-rcu list_bl to use non-raw locks on RT.

BTW, I'm wondering what makes bit spinlocks worse than raw spinlocks on
RT...  commit ad7675b15fd87f19 says there's no lockdep visibility, but that
seems orthogonal to RT, and could be addressed by adding a dep_map on debug
builds the same way the raw lock is currently added.  The other bit spinloc=
k
conversion commits that I could find are replacing them with non-raw locks.

-Scott


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

