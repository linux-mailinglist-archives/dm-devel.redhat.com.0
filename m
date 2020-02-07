Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 42CEE155D38
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 18:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581098277;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vIW6M0jlTlov/S/m3C28/LLH3EheITGvakEnCBB67Jg=;
	b=FZ5YHzET6BcBWrKfFcnaFz5BWMaI8BRWIA71nBDfoPr3lqO8ZdkN260hY2+92vxFd8oMqG
	3eSmMHW29JhvQBVXZ1vs0LTl6Ghn8/dNVVhUTImoZa7r7fbqMgeTS7qeq7EbjGCErFW2QD
	ttVrG5R+xQETjJaH4Pt9XKNcELbdqaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-aYbu_fvZN6GJGS6Qd-0evw-1; Fri, 07 Feb 2020 12:57:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DD2518AB2C9;
	Fri,  7 Feb 2020 17:57:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48CCC7792A;
	Fri,  7 Feb 2020 17:57:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FF8018089CD;
	Fri,  7 Feb 2020 17:57:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017HvMpj012936 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 12:57:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA2E92166B2A; Fri,  7 Feb 2020 17:57:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C646D2166B27
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 17:57:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 370B680387E
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 17:57:20 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
	[209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-121-4jZX1WpBMSiJ4yjaoJK6wg-1; Fri, 07 Feb 2020 12:57:18 -0500
Received: by mail-qv1-f70.google.com with SMTP id k2so10470qvu.22
	for <dm-devel@redhat.com>; Fri, 07 Feb 2020 09:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kxD11E1d/ddHsdPI9PYTUr/L2WzYFq09+QeCUwHbAyk=;
	b=qVT3REK2LDGSh4b5vidi60o2qeyulh60PEnCU9B7vkplZXLvNkl5j24uKPVwokWm97
	Xt+myziCJHIRgFh75ZPrzYXBKNRQT9PV+9UcinLw6Z0a+PphVD6hTxqGjShhz7VGRbjU
	pBhQ7njJVwgUd0QLlmyGPjQNAbfbPjUCuhsbFnDXQRpGjgJ5DJOckbkPZ5zEqX2Ynh5F
	qyCZhddzNy8yxJEZ0ob1Ft7qViDevCsJuODfKdJUQtowJu982h3Ihe8ETQBOS2sorWHd
	Z09U6/L6X8SDVofBkXhz0go2dJNq7hMYCI3c9PoXnG118HUjHGbpVzRK8FP056Idtl7u
	BGyw==
X-Gm-Message-State: APjAAAVndEoIkp6+1/7C5LOOyd1oLNRilYPTUBIhXQ7hWiA12WHtnTfT
	Cv2+oz9KWpwpsulROj892Gur4MsYQovKyiB7Gziq8AvfZPHO/+7Nq11U+PMCM8CX/LOgEtOcGyI
	rR7OFgrGK6ScnL1sDLhl2fsQPdZXkk+4=
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr36393qvb.198.1581098237656;
	Fri, 07 Feb 2020 09:57:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqy09pxWC7F0zeFX8wM3SjiLNofEU8JRBzjHZMcZJCIteCM2hSMn+1ssSy3DYkF3221OoaCbX306twN99mZvyRo=
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr36355qvb.198.1581098237150;
	Fri, 07 Feb 2020 09:57:17 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2002071143390.32552@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2002071143390.32552@file01.intranet.prod.int.rdu2.redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Fri, 7 Feb 2020 12:57:06 -0500
Message-ID: <CAMeeMh-8MN=Jf4YhJ+Vx9-=Xa84EAPuDFyUk+jNU7ChB_EJ-6Q@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-MC-Unique: 4jZX1WpBMSiJ4yjaoJK6wg-1
X-MC-Unique: aYbu_fvZN6GJGS6Qd-0evw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017HvMpj012936
X-loop: dm-devel@redhat.com
Cc: Heinz Mauelshagen <heinzm@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-bufio: implement discard
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> +/*
> + * Free the specified range of buffers. If a buffer is held by other process, it
> + * is not freed. If a buffer is dirty, it is discarded without writeback.
> + * Finally, send the discard request to the device.
Might be clearer to say "After freeing, send a discard request for the
specified range to the device." to clarify that it's all cases, not
just the dirty-buffer case mentioned in the previous sentence.

> + */
> +int dm_bufio_discard_buffers(struct dm_bufio_client *c, sector_t block, sector_t count)
> +{
> +       sector_t i;
> +
> +       for (i = block; i < block + count; i++) {
> +               struct dm_buffer *b;
> +               dm_bufio_lock(c);
> +               b = __find(c, i);
> +               if (b && likely(!b->hold_count)) {
> +                       wait_on_bit_io(&b->state, B_READING, TASK_UNINTERRUPTIBLE);
> +                       wait_on_bit_io(&b->state, B_WRITING, TASK_UNINTERRUPTIBLE);
> +                       __unlink_buffer(b);
> +                       __free_buffer_wake(b);
> +               }
> +               dm_bufio_unlock(c);
> +       }
> +
> +       return dm_bufio_issue_discard(c, block, count);
> +}
> +EXPORT_SYMBOL_GPL(dm_bufio_discard_buffers);

This seems dangerous -- if another process is holding the buffer, you
could be issuing a discard while they are reading or writing, or vice
versa.

Discards whose lifetime overlaps with the lifetime of a read or write
to the same region have undefined behavior, as far as I know.

Perhaps dm_bufio_issue_discard() should allow the caller to specify a
callback, in which case dm_bufio_discard_buffers could unlock any
buffers in the range upon completion; or dm_bufio_discard_buffers
should not issue discards for blocks held by other processes.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

