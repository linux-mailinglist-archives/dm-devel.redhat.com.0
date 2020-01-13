Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4006C13A8C5
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 12:56:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579002963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rE4iWg/OJAysnlMPubalgfxyaYHYgHc8C49FcgxUAJE=;
	b=iLK57wTlT/j3rYdc2KEYkVCWcqOWUdypsCgP4DZX4hMr5/nfpTRIgQIo1YdHW9r6GNzTJs
	p9RuDcumqymf6jPhRldn+rV+xdgrTxuf5CiVwvR6hwyo41e3YjZbik+YnZCaKEqkQW7l5I
	6hSJMt3YoYocNj/Bv7Psma+v+hTvhVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-mfkFciMsNUW2lNtIEHB7sQ-1; Tue, 14 Jan 2020 06:55:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B45800D50;
	Tue, 14 Jan 2020 11:55:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82AE05DA7B;
	Tue, 14 Jan 2020 11:55:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5757187087;
	Tue, 14 Jan 2020 11:55:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DLffaY015036 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 16:41:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3EB2010F1C01; Mon, 13 Jan 2020 21:41:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A6EA10F1BFF
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 21:41:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 350F68012C3
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 21:41:39 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-420--Wy77FJoNtCCeoSL9gSTug-1; Mon, 13 Jan 2020 16:41:37 -0500
Received: by mail-io1-f49.google.com with SMTP id d15so11534818iog.3
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 13:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pWazVMOmHzaOUtcU+FiUiw5RhB3z9UoELGtPgC0EWiY=;
	b=iX6q7gltMIn92X4f52JmBmbCy0coNdBKV4HlI7jikuZbrLg1qXYYEhGpY00kfjzAyS
	OlG8GGbS4m+fXZzseoTPrCDZVLfbwqurSRvb0Pqk+3QUWjy0taGnb6s7+zSdTiqtGNpq
	GOlomlnG+y+H/DmY0V0nYfP9+hkmN3jgUZfLRsM+4Wg649vhVM4iQF1vGs6CfU+pq+O6
	AKVUMKFCGTMWGN8X6BzIHbGoIBZy2+je3lwqp3bKv7WOB2ShPDYBjBl1vvoleKJeRIMx
	oc/7fuDd28ZMFi66ZgfrVQCJjyqOkjukn60h4I1rtBagxS5aFuJZ0e9Fj+j9HQbgOvuZ
	FX3w==
X-Gm-Message-State: APjAAAXzLbiiUmWB9F/T6YeSkn24bJ3Kqdz569+j07VB+iTZAOayj6FE
	rKjeUuhLLW9FtUA19rp/LmduR2LC7GIoYR6moAFlqTGI
X-Google-Smtp-Source: APXvYqxZeZlCxIuPAVJ6nlbCoCwNlZ0XsgSjpxTvTGEftmi0aiYSRVfkp5w2PVZfIfGIjomOMVVZrY2fKJLsT9d/izI=
X-Received: by 2002:a6b:6118:: with SMTP id v24mr14598612iob.73.1578951696654; 
	Mon, 13 Jan 2020 13:41:36 -0800 (PST)
MIME-Version: 1.0
References: <CAJH6TXhnkB10BUENn0P+qXy4nunwY6QVtgDvaFVpfGDpvE-V=Q@mail.gmail.com>
	<CAPhsuW6srGADYYD4dsUbVVBcz4bfJ-taoOy6ccpXjyU26jVTEg@mail.gmail.com>
	<20200113181654.GA7645@lazy.lzy>
	<CAPhsuW6urOBa5s9od-znfn9J2jhz3cCOxmqu6tABvyoCEx5BHQ@mail.gmail.com>
In-Reply-To: <CAPhsuW6urOBa5s9od-znfn9J2jhz3cCOxmqu6tABvyoCEx5BHQ@mail.gmail.com>
From: Gandalf Corvotempesta <gandalf.corvotempesta@gmail.com>
Date: Mon, 13 Jan 2020 22:41:25 +0100
Message-ID: <CAJH6TXjN8V4a4jE6AECCg=quMd9FPA=ST0_9ZtZcGKUzvY5wYg@mail.gmail.com>
To: Song Liu <song@kernel.org>
X-MC-Unique: -Wy77FJoNtCCeoSL9gSTug-1
X-MC-Unique: mfkFciMsNUW2lNtIEHB7sQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00DLffaY015036
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Jan 2020 06:55:09 -0500
Cc: Linux RAID Mailing List <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
Subject: Re: [dm-devel] dm-integrity
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Il giorno lun 13 gen 2020 alle ore 19:58 Song Liu <song@kernel.org> ha scritto:
> Right now, md_done_sync() doesn't really print any message. I think this is
> easy to add. However, md check/recovery is at block granularity, so we
> probably cannot print exact which sector got fixed.

Well, having the exact sector fixed is not mandatory, but really useful.
Better than nothing would be md logging that has fixed "something" and
it's location (a setor, a block, ....)
9 times out of 10 the dm-integrity log would be just above the md log,
so a match between dm-integrity sector and md block would be easy,
just read the line below or above.

I think that md should be a little bit more verbose on certain
actions. (in example, saying what was fixed, the last time of scrub
and it's result, as per my previous thread and so on)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

