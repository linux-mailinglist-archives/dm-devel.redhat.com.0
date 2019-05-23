Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB69291EA
	for <lists+dm-devel@lfdr.de>; Fri, 24 May 2019 09:41:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A29193092667;
	Fri, 24 May 2019 07:40:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DE5160C9E;
	Fri, 24 May 2019 07:39:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C67ED1833004;
	Fri, 24 May 2019 07:38:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4NH6uRl028755 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 13:06:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AB995C219; Thu, 23 May 2019 17:06:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E55535C69A;
	Thu, 23 May 2019 17:06:51 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E7A188311;
	Thu, 23 May 2019 17:06:40 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z19so4741020qtz.13;
	Thu, 23 May 2019 10:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tzAHR5rmfh/TFIXYIHzSw6buL7+70H5Ot5Wu7FBJYBo=;
	b=jDsWohnysffIeI5APcrXrgR6fZ5MhkH09iEGmhgZ7kCViXYEOhyCd7y91chqUmipEt
	2FrDCGIeKkQFN1tObQUQrbWMrtirnRaUkr3eft07i55kERGDhIXgXnq0/6wLFc/CGQ3/
	AtEyxF4daRvXgqxCj1agF+7krmG7CUq9ytikxiGSnwjEdB5pT8o0YTyYjGUAga0mCfwF
	zpfVTtCw46jMJpmznBtD3FNtoie2Jar4l4RqUs01Xgg+fD5e3Oi5nn6VHFgaclmYRENo
	1OQ1EuP9DHtDkIqJpJfAQPZBoW08gQ3valir3Kb3v7KhHTcFpL/eVEFwSCfwZQ58zypp
	vrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tzAHR5rmfh/TFIXYIHzSw6buL7+70H5Ot5Wu7FBJYBo=;
	b=GsBBHxC5cD64CTjxnazbZDh8vNT4VvGgqptoXSF9bSqQfgQChqQcew+rKyVFKJQfm7
	jbV7BlV0rjJ6yupftxto2gApB6AroMa4tZB4cvGdBDaC0bPPSzz6mP2UOVu+Xl7idWVw
	iKhYLkqtAT7gAJTyHeQIXlaAtKZAOg6+b0ZkQC471YfvQp/QdzlupIr0wBuNGGpgrTE9
	WeKzIhNclKLF5nJ6RGkqjROrzqZ2T/NcehHwHqcntXPtEsDsk9wIMxfTDaxAOEaE1Iku
	0/6D8cd6K+j2GbBd9MAPXRtDqRIWcWmEU89v4Fk9CXhhr9cvF98SnjWVHktCNdodZRVQ
	/mEw==
X-Gm-Message-State: APjAAAW6HkRhlh5z6e7RJG5199mQsF3lHyZcHyDyxIbfuNlCyXW+wsnb
	AhfiCbW0S05awpELMbuOLGxeNu9EJyQO0jx7n1M=
X-Google-Smtp-Source: APXvYqyoqxK6/SVoOZtsXHuNMWFHMGBI1KxeWNxGegcBVtTenide+MA2bCnqDhY+dBeXRgVq/5iUc/zWBy6uAqEpyTE=
X-Received: by 2002:ac8:16a4:: with SMTP id r33mr54894808qtj.118.1558631199474;
	Thu, 23 May 2019 10:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190520220911.25192-1-gpiccoli@canonical.com>
	<CAPhsuW6KayaNR-0eFHpvPG-LVuPFL_1OFjvZpOcnapVFe2vC9Q@mail.gmail.com>
	<3e583b2d-742a-3238-69ed-7a2e6cce417b@canonical.com>
In-Reply-To: <3e583b2d-742a-3238-69ed-7a2e6cce417b@canonical.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Thu, 23 May 2019 10:06:28 -0700
Message-ID: <CAPhsuW7o9bj5DYnUDkCqDeW7NnfNTSBBWJC5_ZVxhoomDEEJcg@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 23 May 2019 17:06:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Thu, 23 May 2019 17:06:40 +0000 (UTC) for IP:'209.85.160.195'
	DOMAIN:'mail-qt1-f195.google.com'
	HELO:'mail-qt1-f195.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.142  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.160.195 mail-qt1-f195.google.com 209.85.160.195
	mail-qt1-f195.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 24 May 2019 03:36:06 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Bart Van Assche <bvanassche@acm.org>, hch@infradead.org,
	"Guilherme G. Piccoli" <kernel@gpiccoli.net>,
	stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Eric Ren <renzhengeek@gmail.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH V2 1/2] block: Fix a NULL pointer dereference
	in generic_make_request()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 24 May 2019 07:41:35 +0000 (UTC)

On Thu, May 23, 2019 at 7:36 AM Guilherme G. Piccoli
<gpiccoli@canonical.com> wrote:
>
> On 21/05/2019 02:59, Song Liu wrote:
> >
> > Applied both patches! Thanks for the fix!
>
> Hi Song, sorry for the annoyance, but the situation of both patches is a
> bit confused for me heheh
>
> You mention you've applied both patches - I couldn't find your tree.
> Also, Christoph noticed Ming's series fixes both issues and suggested to
> drop both my patches in favor of Ming's clean-up, or at least make them
> -stable only.
>
> So, what is the current status of the patches? Can we have them on
> -stable trees at least? If so, how should I proceed?
>
> Thanks in advance for the clarification!
> Cheers,
>
>
> Guilherme

Sorry for the confusion and delay. I will send patches to stable@.

Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
