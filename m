Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 001E822012A
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 01:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594770904;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GXLdLIuufNwcxjuIzlbCgXGPC/z4e9U2KP0T70flH2U=;
	b=ODkywNSrk3pNMxCwH0n6nWicXm6P7WnC3O001Fvxyt/MTeGZu2E6cOUuN/0lg29Y3QSPQf
	W5+8v0w139bHzJr5CXTfhNh8wrzOijDftVsqaw/nMT6g3jc+ozZVuZMhXbJKdNbrkUQDwP
	KCJarPZBVRQ8/FOF4QzVASHVkhpx6Xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-uuyUsgVEPza3Na-7R-wu3Q-1; Tue, 14 Jul 2020 19:55:01 -0400
X-MC-Unique: uuyUsgVEPza3Na-7R-wu3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7180E1800D42;
	Tue, 14 Jul 2020 23:54:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C511860BEC;
	Tue, 14 Jul 2020 23:54:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D329180954D;
	Tue, 14 Jul 2020 23:54:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06ENsRaN027937 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 19:54:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 303147980F; Tue, 14 Jul 2020 23:54:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3BD079CF1;
	Tue, 14 Jul 2020 23:54:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06ENsMON006815; 
	Tue, 14 Jul 2020 18:54:22 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06ENsL1d006814;
	Tue, 14 Jul 2020 18:54:21 -0500
Date: Tue, 14 Jul 2020 18:54:21 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200714235421.GL11089@octiron.msp.redhat.com>
References: <20200713110743.26329-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200713110743.26329-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/4]  Fix segfault on access to mpp->hwe
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
Content-Disposition: inline

On Mon, Jul 13, 2020 at 01:07:39PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This is in response to Lixiaokeng's post
> "master - libmultipath: fix use after free when iscsi logs in".
> 
> On top of Lixiaokeng's patch, I've added some log messages and
> a fix for mpp->hwe handling in sync_paths().
> 
> The question remains how we handle maps without paths. I believe we're good
> here, please review my assessment.
> 
> mpp->hwe is only accessed in propsel.c, via the mp_set_hwe() macro. Patch 3 of
> my series adds an error message if this happens while mpp->hwe is NULL. IMO it
> shouldn't happen because we don't check map properties for empty
> maps. Normally this is done when a map is created, and we don't create maps
> without paths.
> 
> The case where a map looses all paths during its normal lifetime and
> can't be removed (e.g. because it's busy) is already covered by the
> current code AFAICT. When a new path is re-added, we'll call adopt_paths
> and verify_paths(), which will make sure that mpp->hwe is set again
> to the pp->hwe member of the newly added path.
> 
> Reviews and comments welcome.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> Regards
> Martin
> 
> Martin Wilck (3):
>   libmultipath: warn if freeing path that holds mpp->hwe
>   libmultipath: warn about NULL value of mpp->hwe
>   libmultipath: fix mpp->hwe handling in sync_paths()
> 
> lixiaokeng (1):
>   master - libmultipath: fix use after free when iscsi logs in
> 
>  libmultipath/propsel.c     | 4 +++-
>  libmultipath/structs_vec.c | 9 +++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

