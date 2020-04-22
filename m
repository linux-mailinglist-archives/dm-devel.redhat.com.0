Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 162891B4F8F
	for <lists+dm-devel@lfdr.de>; Wed, 22 Apr 2020 23:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587591791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZTgFU6C/2n+ZZcjFcve4cMygkVvrFA7oT4JLXmbeMbY=;
	b=EzQppiB3qZ8TGMmc6FKSKO26V3T04xW2GSDih6ptysldlJeukNYc26xd7+9TEghOfYgof6
	AfZbh9Kb45vQKGYwPII+i73WWvz0YTi6I8JBaLZ4vrXWjQsF5Y/Jn9jG/SaasUs4WCfZcc
	uW+DfFGe+EL5PPBD2H79QiBfGWs05As=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-PvNp8HziNtGU2LJAAM10HQ-1; Wed, 22 Apr 2020 17:43:08 -0400
X-MC-Unique: PvNp8HziNtGU2LJAAM10HQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 109A0800FC7;
	Wed, 22 Apr 2020 21:43:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D13F10246E7;
	Wed, 22 Apr 2020 21:42:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E08211809541;
	Wed, 22 Apr 2020 21:42:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MLeuYX009736 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 17:40:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7722A600E8; Wed, 22 Apr 2020 21:40:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A7C2600E5;
	Wed, 22 Apr 2020 21:40:53 +0000 (UTC)
Date: Wed, 22 Apr 2020 17:40:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Milan Broz <gmazyland@gmail.com>
Message-ID: <20200422214052.GA10695@redhat.com>
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
	<20200421182754.GA49104@lobo>
	<e3b78a32-4307-c60c-f9c3-dd6d71b6633c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e3b78a32-4307-c60c-f9c3-dd6d71b6633c@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Apr 22 2020 at 12:47pm -0400,
Milan Broz <gmazyland@gmail.com> wrote:

> On 21/04/2020 20:27, Mike Snitzer wrote:
> > On Mon, Apr 20 2020 at  9:46P -0400,
> > Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> > 
> >> From: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
> >>
> >> Allow one to use encrypted in addition to user and login key types for
> >> device encryption.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
> > 
> > I fixed up some issues, please see the following incremental patch,
> > I'll get this folded in and staged for 5.8.
> 
> And you just created hard dependence on encrypted key type...
> 
> If you disable this type (CONFIG_ENCRYPTED_KEYS option), it cannot load the module anymore:
> ERROR: modpost: "key_type_encrypted" [drivers/md/dm-crypt.ko] undefined!

Yes, I was made aware via linux-next last night.

> We had this idea before, and this implementation in dm-crypt just requires dynamic
> key type loading implemented first.
>
> David Howells (cc) promised that moths ago, but apparently nothing was yet submitted
> (and the proof-of-concept patch no longer works).

Why is it so bad for dm-crypt to depend on CONFIG_ENCRYPTED_KEYS while
we wait for the innovation from David?
 
> Mike, I think you should revert this patch from the tree until it is solved.
> 
> Once fixed, we should also support "trusted" key type.
> 
> Also please -  do no forget to increase dm-crypt minor version here...

I fixed the patch up and staged it in linux-next to get test coverage,
see:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=for-next&id=5eb07fda05fbf87d9a37939d1cd445203c55e126

Doesn't mean I intend to keep it staged; just would like to validate the
patch before tabling it (if that's what is ultimately decided for now).

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

