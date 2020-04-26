Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6F51B9875
	for <lists+dm-devel@lfdr.de>; Mon, 27 Apr 2020 09:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587972257;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9PcYoh18IlqilZW+Ud9zYtRiMtbZnFENWobHMpbRDCs=;
	b=D6Qt6SzkvxLAypqwj8vno43+DwJm9szoZkUorUke4A4SRvbRkfzRR+GDGOEvb523BDpKyM
	KNELjRGiPOZVpL/46YsjmQxj8GROpY30vJiroaM+r/236yq/RepdQSnQxELwlac2q2MIte
	8LT73EI5KqV0J+vQYLWO8pIUfl9UOgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-OmgL7PtcNDidGbRfwkVmWg-1; Mon, 27 Apr 2020 03:24:14 -0400
X-MC-Unique: OmgL7PtcNDidGbRfwkVmWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 703731895A2D;
	Mon, 27 Apr 2020 07:24:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D9585C1D4;
	Mon, 27 Apr 2020 07:24:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE5F11809542;
	Mon, 27 Apr 2020 07:24:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03QK0U5v028941 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 26 Apr 2020 16:00:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 380B92156A3A; Sun, 26 Apr 2020 20:00:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 344132166BA4
	for <dm-devel@redhat.com>; Sun, 26 Apr 2020 20:00:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A582E800294
	for <dm-devel@redhat.com>; Sun, 26 Apr 2020 20:00:27 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-349-CbSkidkLNHehrWSvborpBg-1; Sun, 26 Apr 2020 16:00:22 -0400
X-MC-Unique: CbSkidkLNHehrWSvborpBg-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 8605C2A092E
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Mike Snitzer <snitzer@redhat.com>
Organization: Collabora
References: <20200416211336.2423618-1-krisman@collabora.com>
	<20200423205947.GA13657@lobo>
Date: Sun, 26 Apr 2020 16:00:17 -0400
In-Reply-To: <20200423205947.GA13657@lobo> (Mike Snitzer's message of "Thu, 23
	Apr 2020 16:59:47 -0400")
Message-ID: <855zdm2f1q.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03QK0U5v028941
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 Apr 2020 03:23:40 -0400
Cc: dm-devel@redhat.com, khazhy@google.com, kernel@collabora.com,
	linux-kernel@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] Historical Service Time Path Selector
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mike Snitzer <snitzer@redhat.com> writes:

>
> Looks like you've put a lot of time to this and I'd be happy to help
> you get this to land upstream.
>
> But... (you knew there'd be at least one "but" right? ;) I'm not
> liking making this path selector request-based specific.  All other
> selectors up to this point are request-based vs bio-based agnostic.
>
> Would you be open to dropping patch 1/2 and replacing it with
> something like the following patch?
>
> Then you'd pass 'u64 start_time_ns' into the path_selector_type's
> .end_io (and possibly .start_io).

I think it is fine.

Kind of a MD newbie question, but if I understand correctly,
dm_start_time_ns_from_clone is only for bio based multipath, and we just
pass req->io_start_time directly on request based multipath, right?  If
I understand the code correctly, start_io_acct is only called for the
bio level DM.

I will update the patches, do a quick round of tests with BIO based and
send a v2.

Thanks a lot,

-- 
Gabriel Krisman Bertazi


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

