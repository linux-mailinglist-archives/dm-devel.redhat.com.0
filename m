Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BB75913BB39
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jan 2020 09:37:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579077476;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VBfGbmVhk8siMqC5Wm4mNi/IIzpCy9rgdwmHcGdfiQk=;
	b=ZFOA3MQu3l7+BJCfjK+tiqhN4C6H5WK1gVLFb9PUKHV9A93T6yXIGg9IERZlBac2iUsIgq
	tz+lzqC7MW5erdTU/0/NCB9DB8P+1i5XVwjgJ0Tb7sZxEVuDXywdnTOjVHzVo4zZkrnwgg
	e3xrdYC9U2F2xcLGgIVITjOgPjLjdHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-OquB6bC3NpK5fEflai1Y8w-1; Wed, 15 Jan 2020 03:37:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ADA12EDA;
	Wed, 15 Jan 2020 08:37:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4897184322;
	Wed, 15 Jan 2020 08:37:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1005F18089C8;
	Wed, 15 Jan 2020 08:37:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGVSFa020865 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:31:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 835636DCF3; Tue, 14 Jan 2020 16:31:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EE4CDBF08
	for <dm-devel@redhat.com>; Tue, 14 Jan 2020 16:31:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2578185AB7E
	for <dm-devel@redhat.com>; Tue, 14 Jan 2020 16:31:26 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-417-hEad75BuMa2KwN7lVyrP4Q-1; Tue, 14 Jan 2020 11:31:23 -0500
Received: from localhost (unknown [IPv6:2610:98:8005::27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: krisman)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 35222292898;
	Tue, 14 Jan 2020 16:31:21 +0000 (GMT)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Mike Snitzer <snitzer@redhat.com>
Organization: Collabora
References: <20200113224127.3367484-1-krisman@collabora.com>
	<20200114161505.GA48507@lobo>
Date: Tue, 14 Jan 2020 11:31:18 -0500
In-Reply-To: <20200114161505.GA48507@lobo> (Mike Snitzer's message of "Tue, 14
	Jan 2020 11:15:05 -0500")
Message-ID: <85pnfmyp7t.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-MC-Unique: hEad75BuMa2KwN7lVyrP4Q-1
X-MC-Unique: OquB6bC3NpK5fEflai1Y8w-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGVSFa020865
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 15 Jan 2020 03:37:26 -0500
Cc: dm-devel@redhat.com, kernel@collabora.com, khazhy@google.com
Subject: Re: [dm-devel] [PATCH v2] dm mpath: Add timeout mechanism for
	queue_if_no_path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mike Snitzer <snitzer@redhat.com> writes:

> On Mon, Jan 13 2020 at  5:41P -0500,
> Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
>
>> From: Anatol Pomazau <anatol@google.com>
>> 
>> Add a configurable timeout mechanism to disable queue_if_no_path without
>> assistance from multipathd.  In reality, this reimplements the
>> no_path_retry mechanism from multipathd in kernel space, which is
>> interesting to prevent processes from hanging indefinitely in cases
>> where the daemon might be unable to respond, after a failure or for
>> whatever reason.
>> 
>> Despite replicating the policy configuration on kernel space, it is
>> quite an important case to prevent IOs from hanging forever, waiting for
>> userspace to behave correctly.
>> 
>> v2:
>>   - Use a module parameter instead of configuring per table
>>   - Simplify code
>> 
>> Co-developed-by: Frank Mayhar <fmayhar@google.com>
>> Signed-off-by: Frank Mayhar <fmayhar@google.com>
>> Co-developed-by: Bharath Ravi <rbharath@google.com>
>> Signed-off-by: Bharath Ravi <rbharath@google.com>
>> Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
>> Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
>> Signed-off-by: Anatol Pomazau <anatol@google.com>
>> Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>
> All these tags seem rather excessive (especially in that you aren't cc
> most of them on the submission).  Please review/scrub.  Just seems odd
> that so many had a hand in this relatively small patch.

Hey,

I removed some of the Cc's because those emails addresses were bouncing.
Still, I kept the lines for credits.  I got the bounces when sending v1.

> The Signed-off-by for anatol@google.com seems wrong, or did Anatol
> shephard this patch at some point?  Or did you mean Reviewed-by?
> Something else?

Anatol was the main author, as listed in the From: header.  This
seems correct with regard to the ordering rules of
Documentation/process/submitting-patches.rst, in particular the second
example, (Example of a patch submitted by a Co-developed-by: author::).

Am I missing something?

>
> Anyway, if in the end you hold these tags to reflect the development
> evolution of this patch then so be it ;)
>
> I've reviewed the changes and found various things I felt were
> worthwhile to modify.  Summary:
>
> - included missing <linux/timer.h>
> - added MODULE_PARM_DESC
> - moved new functions to reduce needed forward declarations
> - tweaked queue_if_no_path_timeout_work's DMWARN message
> - added lockdep_assert_held to enable_nopath_timeout
> - renamed static queue_if_no_path_timeout to queue_if_no_path_timeout_secs
> - use READ_ONCE when accessing queue_if_no_path_timeout_secs
>

The changes you made look good to me and your version of the patch
passes my testcase.

-- 
Gabriel Krisman Bertazi


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

