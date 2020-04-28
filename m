Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8C51BC67D
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 19:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588094470;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=njq9PXWF8FSW8cNKeigZ3CZ7+MUfFgwbrLmEyrIQRJM=;
	b=ZwAnRKgQQhlIt+rG8BLyq4ANFPZmsAaA/N/SF+RtveV1K8QLW/y+SCL9PStBpIwdmJfj6F
	BClqt6ozduYubokpPqzSBUPQdKa5eeuVXOrfFFebdmou/c72a2WGvY/AZPOv4ycMT3QQgj
	fPA6jCx1V0+ZERDPAvwc53/D9sLDaHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-h9eJVaDxPdWxhgcnRCkK-A-1; Tue, 28 Apr 2020 13:21:07 -0400
X-MC-Unique: h9eJVaDxPdWxhgcnRCkK-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD749872FE0;
	Tue, 28 Apr 2020 17:20:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3F65F7FD;
	Tue, 28 Apr 2020 17:20:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7519F4CAA0;
	Tue, 28 Apr 2020 17:20:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SHKXDb018566 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 13:20:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2733F5C240; Tue, 28 Apr 2020 17:20:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FA985C1D4;
	Tue, 28 Apr 2020 17:20:30 +0000 (UTC)
Date: Tue, 28 Apr 2020 13:20:29 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200428172028.GA17285@redhat.com>
References: <20200428005146.242231-1-krisman@collabora.com>
	<20200428005146.242231-2-krisman@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200428005146.242231-2-krisman@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kernel@collabora.com, khazhy@google.com,
	agk@redhat.com
Subject: Re: [dm-devel] [PATCH v2 1/3] md: multipath: Encapsulate parameters
 passed to selectors
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 27 2020 at  8:51pm -0400,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> Different selector will use different parameters, which means .io_start
> and .io_end will get their signatures modified to include more and more
> parameters.  This encapsulates the data in a structure so we can
> simplify the interface for future users.  For now it only passes
> nr_bytes, but HST will require start_time already.
> 
> Cc: Khazhismel Kumykov <khazhy@google.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

I really don't see HST's need for start_time_ns in the path selector's
end_io hook as a solid justification for this encapsulation.

Especially in that the parameters needed for ps's start_io and end_io
really aren't symmetric.  Imposing that they are just causes needless
code (an example of that is in patch 2/3).

So please drop this encapsulation.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

