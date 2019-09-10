Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1BAF619
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 08:49:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2521D2A09CB;
	Wed, 11 Sep 2019 06:49:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D13B5D6C8;
	Wed, 11 Sep 2019 06:49:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44D46C592;
	Wed, 11 Sep 2019 06:49:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8A8uEHx024815 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Sep 2019 04:56:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B6415D6C8; Tue, 10 Sep 2019 08:56:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 560BA5D6B2
	for <dm-devel@redhat.com>; Tue, 10 Sep 2019 08:56:11 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3CEE3172D93
	for <dm-devel@redhat.com>; Tue, 10 Sep 2019 08:56:10 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id t8so12768995lfc.13
	for <dm-devel@redhat.com>; Tue, 10 Sep 2019 01:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=android.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UNfZ6D6BkW5VBAgD6NV0GNz1BCxCA3u2wXgw+w9oDDM=;
	b=AHxH269dTSeO5uFrk+ZsTv2xttxAWwY3vGT2RqKL9s0VLWiIaUREEiiQ2NyF1pfTOl
	8tDMzqHAvfuQDvW7vVaKCh7EJX6qYDY0Wa9oCheLgS/9hVZHp3Tx6IfGmTxdieRkl032
	/p07TJ47w4YX+L1Ivl1LQykhDn72UeNSqngrdEaF1KXMWRGigsy57ZykyS+027i/QwLq
	S+TddAHz1w3sJevGi9elfNke689QN8rN9S/cSXFOYB4Ssn8CT9mJxODj+RBHVrwPfBBb
	KLWT10dHr2IGLTW68zuk5XEL26YvdUoOPwYRDTim4Y6LW1aa3pNtzPtMKhrm4gP8UA9f
	rLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UNfZ6D6BkW5VBAgD6NV0GNz1BCxCA3u2wXgw+w9oDDM=;
	b=aWIkAJc8zdgu0Ci19IiChBgMVN0FCtlGpYBUtw4G4qjZ2jHo1MvlzIkZZPqKOBoNhO
	OEfzqObE8AaoLSXB0QOBWPm+e1uKfe2Hw6gwLn+uhXE9nvSFMH2eoE4V7mwGcQGCQaVZ
	0rmbh3eB/tjFNa1ru0nFx6+8n9FrZNM5w3n1zxVS+5h0KOWWhxNlk2aL141sVOqO7qWS
	O5TEywQIaQHiz/PT8y62EHNrEVxAUIEMLFUVQCsWlFF1VYkhTn4pRNVurDsZgzpV2bS8
	LbhNeINAxA2bJ5oEI+XQlgCYkcjxdjncGT63qSCm3+w3FF4ZWLN/2bAmzLlFuVgEgtCz
	2IxA==
X-Gm-Message-State: APjAAAWMqoYgocGTf4f5SAkyaaHt7aqKBMEnLmtPD9HCuwjObv5RUthn
	PiAg72REN85fxKoJDHW7QeCJbdicNCol/g60mRvQig==
X-Google-Smtp-Source: APXvYqx8WFbmdHzdtKi9N5oQGSAaZLgzlIwkKwBIHnTKsUuZ4/h/Dy+UpUVGQdty83dzdc2Fa+IL1f33HIyuzNDtxoY=
X-Received: by 2002:a19:3805:: with SMTP id f5mr19258381lfa.173.1568105769318; 
	Tue, 10 Sep 2019 01:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190906074526.169194-1-maco@android.com>
	<20190909145703.GA16249@redhat.com>
In-Reply-To: <20190909145703.GA16249@redhat.com>
From: Martijn Coenen <maco@android.com>
Date: Tue, 10 Sep 2019 10:55:58 +0200
Message-ID: <CAB0TPYEb-WdggSj=i+tpABfkO9KFqcgMc0twMx0L=ZcAN4HDfw@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 10 Sep 2019 08:56:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 10 Sep 2019 08:56:11 +0000 (UTC) for IP:'209.85.167.52'
	DOMAIN:'mail-lf1-f52.google.com' HELO:'mail-lf1-f52.google.com'
	FROM:'maco@android.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.167.52 mail-lf1-f52.google.com 209.85.167.52
	mail-lf1-f52.google.com <maco@android.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 11 Sep 2019 02:49:03 -0400
Cc: Dario Freni <dariofreni@google.com>, Jiyong Park <jiyong@google.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
	Martijn Coenen <maco@google.com>, Mikulas Patocka <mpatocka@redhat.com>,
	Nikita Ioffe <ioffe@google.com>,
	Narayan Kamath <narayan@google.com>, kernel-team@android.com,
	agk@redhat.com
Subject: Re: [dm-devel] dm-bufio: Allow clients to specify an upper bound on
	cache size.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 11 Sep 2019 06:49:46 +0000 (UTC)

Hi Mike,

On Mon, Sep 9, 2019 at 4:57 PM Mike Snitzer <snitzer@redhat.com> wrote:
> Definitely not very intuitive.. but yes I think it is a reasonable
> tradeoff between your goals and further code complexity to be able to
> achieve the "ideal".

Thanks for the feedback. I do have a patch for the "optimal"
allocation lying around as well, if you'd like to take a look. It's
not as bad as I thought, but it does require another list_head in
dm_bufio_client; other than that it's just O(N), so not so bad.

> Think the documented example can be made clearer by documenting that
> dm_bufio_cache_size_per_client = 49.  And that _that_ is the reason why
> the client that didn't set a maximum is bounded to 49.

Ack, will send a v2 to clarify.

>
> Overall I think this patch looks reasonable, but I'd like Mikulas to
> review this closer before I pick it up.

Thanks; let me know if you want to see the alternative as an RFC, and
I'll clean it up and send it out.

Thanks,
Martijn

>
> Thanks,
> Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
