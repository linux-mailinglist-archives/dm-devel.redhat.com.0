Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EF47A23D1BC
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 22:05:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-9AHxXNXpMgyzbQ_72wo8Gw-1; Wed, 05 Aug 2020 16:05:54 -0400
X-MC-Unique: 9AHxXNXpMgyzbQ_72wo8Gw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CB5D57;
	Wed,  5 Aug 2020 20:05:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D35C5DA8C;
	Wed,  5 Aug 2020 20:05:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB6F21809554;
	Wed,  5 Aug 2020 20:05:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075K5Sd2010159 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 16:05:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB3D4EE397; Wed,  5 Aug 2020 20:05:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C48DAF49D9
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 20:05:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DFD710D31D7
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 20:05:25 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-481-NMRirEMpNq62x2M4qw_nQA-1;
	Wed, 05 Aug 2020 16:05:21 -0400
X-MC-Unique: NMRirEMpNq62x2M4qw_nQA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CDBD2AC19;
	Wed,  5 Aug 2020 20:05:36 +0000 (UTC)
Message-ID: <a51ef1b268de27db37386ba05af009f513ecce84.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 05 Aug 2020 22:05:19 +0200
In-Reply-To: <20200719052617.GY11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-17-mwilck@suse.com>
	<20200719052617.GY11089@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 69/74] libmultipath: disassemble_map(): get
 rid of "is_daemon" argument
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-19 at 00:26 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 09, 2020 at 12:51:40PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > The reason for the is_daemon parameter in disassemble_map() lies
> > deep in multipath-tools' past, in b96dead ("[multipathd] remove the
> > retry login in uev_remove_path()"): By not adding paths from
> > disassembled maps to the pathvec, we avoided to re-add removed
> > paths on
> > future map reloads (logic in update_mpp_paths()). As we can handle
> > this with
> > INIT_REMOVED now, we don't need to distinguish daemon and non-
> > daemon
> > mode any more. This fixes a memory leak, because only paths which
> > are in
> > pathvec will be freed on program exit.
> 
> I don't have any problems with the code in this patch. I just want to
> reiterate that I don't think that multipathd should automatically be
> adding paths, just because they were in a multipath device.  In my
> opinion, multipathd should have the final decision as to what a
> multipath device should look like.  If it sees an unexpected path,
> and
> runs pathinfo on it, and finds that that path does belong, it's fine
> to
> add it. But if pathinfo says that the path doesn't belong, multipathd
> shouldn't add it to the pathvec. It should instead trigger a reload
> of
> the device to remove path.

Got it. I commented in my reply to 65/74. I'll repost this part with
the minor issues you raised fixed (hopefully). Then let's review /
discuss this again. If we agree on your PoV, we can probably ditch the
whole INIT_REMOVED part of my series.

I hope you agree that "if (!is_daemon)" so deep in libmultipath
is ugly and should be replaced by something cleaner.

We should take the opportunity to agree on a definition on the exact
semantics of pathvec, i.e. which devices should be members of pathvec,
and which ones shouldn't. I don't see a clear, consequent definition
currently.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

