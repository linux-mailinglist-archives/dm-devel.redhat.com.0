Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EE2921CE120
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 19:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589216585;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YBKfWj2iw5HJh9KgfYAR/2wXF2m+egVA0BxQQOi7LLU=;
	b=P2GCQHg06Y++4f/9ZyUeBYdODuJZPfg1bokPQu2oXFxKsllLYfy4OXtOU0d+uvoF0rvF+6
	tCFJHE/J/I8I45UpYJmx9DjEWna1qUdSb/0PGIbR9i9hbkpaYNgi3c35iTajpHwQNS/Ndm
	LJKnE3AG8wVMhfqwdH9ejPc8HlmO020=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-pknw21FxMY69A-UxL9yQtw-1; Mon, 11 May 2020 13:03:02 -0400
X-MC-Unique: pknw21FxMY69A-UxL9yQtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E98E835B42;
	Mon, 11 May 2020 17:02:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E0546199D;
	Mon, 11 May 2020 17:02:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFC901809543;
	Mon, 11 May 2020 17:02:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BH2ffg017006 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 13:02:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29DD75C679; Mon, 11 May 2020 17:02:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09ADC5C254;
	Mon, 11 May 2020 17:02:36 +0000 (UTC)
Date: Mon, 11 May 2020 13:02:35 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200511170235.GA7719@redhat.com>
References: <20200511163910.3778467-1-krisman@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200511163910.3778467-1-krisman@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: breeves@redhat.com, linux-kernel@vger.kernel.org, khazhy@google.com,
	song@kernel.org, dm-devel@redhat.com, mpatocka@redhat.com,
	kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v4 0/2] Historical Service Time Path Selector
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

On Mon, May 11 2020 at 12:39pm -0400,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> Hi,
> 
> This fourth version of HST applies the suggestion from Mikulas Patocka
> to do the ktime_get_ns inside the mpath map_bio instead of generic
> device-mapper code. This means that struct dm_mpath_io gained another
> 64bit field.  For the request-based case, we continue to use the block
> layer start time information.
> 
> With this modification, I was able obtain similar performance on  BIO
> to request-based multipath with HST on the benchmarks shared in v1.
> 
> v3: https://www.redhat.com/archives/dm-devel/2020-April/msg00308.html
> v2: https://www.redhat.com/archives/dm-devel/2020-April/msg00270.html
> v1: https://www.redhat.com/archives/dm-devel/2020-April/msg00176.html

I already staged your v3 in linux-next.  Please provide an incremental
patch that layers on this git branch:

https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=dm-5.8

I was hopeful for a flag to be set (e.g. in 'struct path_selector') to
reflect whether the path selector expects highres start_time.  Makes
little sense to incur that extra cost of providing the time if the path
selector doesn't even use it.

Alternatively, could split out the setting of the time needed by .end_io
to a new path_selector_type method (e.g. .set_start_time).  And then
only use ktime_get_ns() for bio-based if .set_start_time is defined.
Would get a little fiddly needing to make sure a stale start_time isn't
used... also, makes more sense to conditionally call this
.set_start_time just after .start_io is.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

