Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E9CD61B5D44
	for <lists+dm-devel@lfdr.de>; Thu, 23 Apr 2020 16:06:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587650801;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EVa0e5U9Wnc2kVFFd7NOdfAppFReZ2NqS/v0Wquk060=;
	b=cQFIEBMlR3U5bM01T+hGwExXLYC0a8U/3YVZJ42p+smgVft/ONtXJj8NqSiv82qoq/DadZ
	Brg9V/baIEaaG/v982MIYge6gzGdnPeYdw5Ngsn/rD0qKYG58PcdthLhgWIU/5uAWjImdF
	9zUhmxXdi0BSC/VnuwMP90E04WVc2jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-g3p-pLzNPrqmPkgnKAXypw-1; Thu, 23 Apr 2020 10:06:38 -0400
X-MC-Unique: g3p-pLzNPrqmPkgnKAXypw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 574E0107ACCA;
	Thu, 23 Apr 2020 14:06:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6AC5D9CC;
	Thu, 23 Apr 2020 14:06:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF6E74CA95;
	Thu, 23 Apr 2020 14:06:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NE6IRQ004921 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 10:06:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4CB6A6060E; Thu, 23 Apr 2020 14:06:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D7F860609;
	Thu, 23 Apr 2020 14:06:13 +0000 (UTC)
Date: Thu, 23 Apr 2020 10:06:12 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Milan Broz <gmazyland@gmail.com>
Message-ID: <20200423140612.GA14885@redhat.com>
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
	<20200421182754.GA49104@lobo>
	<e3b78a32-4307-c60c-f9c3-dd6d71b6633c@gmail.com>
	<20200422214052.GA10695@redhat.com>
	<67eedf43-7afb-3c2e-704a-d0ac187d6a4b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <67eedf43-7afb-3c2e-704a-d0ac187d6a4b@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry_baryshkov@mentor.com>,
	David Howells <dhowells@redhat.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-crypt: support using encrypted keys
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Apr 23 2020 at  2:47am -0400,
Milan Broz <gmazyland@gmail.com> wrote:

> On 22/04/2020 23:40, Mike Snitzer wrote:
> > On Wed, Apr 22 2020 at 12:47pm -0400,
> > Milan Broz <gmazyland@gmail.com> wrote:
> > 
> >> On 21/04/2020 20:27, Mike Snitzer wrote:
> >>> On Mon, Apr 20 2020 at  9:46P -0400,
> >>> Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> >>>
> >>>> From: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
> >>>>
> >>>> Allow one to use encrypted in addition to user and login key types for
> >>>> device encryption.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
> >>>
> >>> I fixed up some issues, please see the following incremental patch,
> >>> I'll get this folded in and staged for 5.8.
> >>
> >> And you just created hard dependence on encrypted key type...
> >>
> >> If you disable this type (CONFIG_ENCRYPTED_KEYS option), it cannot load the module anymore:
> >> ERROR: modpost: "key_type_encrypted" [drivers/md/dm-crypt.ko] undefined!
> > 
> > Yes, I was made aware via linux-next last night.
> > 
> >> We had this idea before, and this implementation in dm-crypt just requires dynamic
> >> key type loading implemented first.
> >>
> >> David Howells (cc) promised that moths ago, but apparently nothing was yet submitted
> >> (and the proof-of-concept patch no longer works).
> > 
> > Why is it so bad for dm-crypt to depend on CONFIG_ENCRYPTED_KEYS while
> > we wait for the innovation from David?
> 
> People need to compile kernel with specific features disabled, even without keyring sometimes.
> We also support whole CONFIG_KEYS disable - and it makes sense for some small appliances.
> 
> In fact I had similar patch (support for encrypted+trusted keyes) for dm-crypt for months,
> with additional patch that loads key types per requests (so it can fail if the type is not available).
> It uses key_type_lookup function exported. IMO this is the way to go.
> 
> So the idea is good, but please keep possibility to disable it.
> Additional dependencies not only cause problems above, but also can get some failures from initrd
> where the new module is missing (that happened several times, it is just problem
> that can be easily avoided).

Seems you didn't look at the fixed patch, here is what I ultimately
staged yesterday:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.8&id=a2b35bd064baf1f4e7504c23d493a3e149172dd1

dm-crypt doesn't have a hard dependency on CONFIG_ENCRYPTED_KEYS.  If it
is enabled support will be available, if not enabled support isn't.

The concern about initramfs not having dep modules is a kernel tooling
support issue.  Not seeing any point withholding capabilities out of
paranoia that a particular distribution's tooling (initramfs generation
upon kernel update) isn't working as needed.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

