Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEF51F03EF
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:28:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403300;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=53DxFspdQr8BcIZX8fj7F/ZkfEtlEIS6E7GqpXbHpg0=;
	b=icsK+rhriXTSTMbcxwwonkfXpAyrIh3nnYlwcX80CKJ/Lou8KcV9yCA/95DcAI7jse38l1
	ScAj++bhFEkkunpZisVwmdxWkbGbIhaZqPK3wGU5SnBTZE5IBPPaXZld1KKkV764H7il32
	xmhq/sBFDzuPWDq54tqGDtVHxOjmykc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-xQDg7P69P3KcjarTqEut6A-1; Fri, 05 Jun 2020 20:24:28 -0400
X-MC-Unique: xQDg7P69P3KcjarTqEut6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C00C1085984;
	Sat,  6 Jun 2020 00:24:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D44D5D9E5;
	Sat,  6 Jun 2020 00:24:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD7B893EFA;
	Sat,  6 Jun 2020 00:24:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Jlwdk004225 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 15:47:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 813A32157F25; Fri,  5 Jun 2020 19:47:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79DC72166BA3
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 19:47:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E40638007A4
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 19:47:54 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-hXfo3yWzNlSSNLQQltitXw-1; Fri, 05 Jun 2020 15:47:53 -0400
X-MC-Unique: hXfo3yWzNlSSNLQQltitXw-1
Received: by mail-wm1-f70.google.com with SMTP id a7so517512wmf.1
	for <dm-devel@redhat.com>; Fri, 05 Jun 2020 12:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jO+0+A0uwyLhCHuiif3r+h/pijs9s9TM4wrYRJvjgCQ=;
	b=KtrsHfojfDUvf7+qHX60FDBC41bkHvTYyEKVVO4nzMI5V5N+V0/DqvlLIodnW3dOss
	aexP2K6jvWq0xOYpR6qp+TQiNySAMn9zLLLOSRns89jjZEkp9ZAtBF8Gr60HzfRBUnPJ
	7c0rfpK2nEPnOLBDOdze2aStg9ff6DGoym/GtAwVc56cihlMEMYGxUrohW6kbk0NY8Dh
	soHGc9esnJxpSXndD/HREn57B2jmTAXmv60zXFJzCOfkAagWrjP5YdvAcqAP6PvsdS6S
	b+zQf0yYy2CZGs1eNOZ4aJe1MVxDjnBg3c1q76S2WkjCr8RAiDni4ZSgniw69GJp9hOQ
	sVoQ==
X-Gm-Message-State: AOAM533aYpPjUbcytA8tGRJ3g2jM0lPNmJYgc5ZXzBW7cMys54ImAtAf
	QGRFfho3Dm0heyV0bmSiKUzbWA4r7QX4UCU789FmM55HwBaAvLSc1w6L39rPLOkDzxR2mhoO8Kc
	y+omOEFDfFIZm8gOhqoTGASACm2rnPLk=
X-Received: by 2002:a7b:cb47:: with SMTP id v7mr4260211wmj.34.1591386471950;
	Fri, 05 Jun 2020 12:47:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY3fkbkX09llvtv1Otb7rrYrk/v0IjnH46QPKJQANkiPRRKmLcO/Q636C1KCU9KRwmZcD4SdSuUwoaX1VrHuk=
X-Received: by 2002:a7b:cb47:: with SMTP id v7mr4260190wmj.34.1591386471688;
	Fri, 05 Jun 2020 12:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200605073201.1742675-1-yangerkun@huawei.com>
	<20200605073201.1742675-3-yangerkun@huawei.com>
In-Reply-To: <20200605073201.1742675-3-yangerkun@huawei.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 5 Jun 2020 15:47:40 -0400
Message-ID: <CAHhmqcRaSBW0q1=Zj-eeTCH2mFxc5L5ec_x8ccQVHxSSN6VB7w@mail.gmail.com>
To: yangerkun <yangerkun@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	"Alasdair G. Kergon" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC 2/2] dm dust: introduce listbadblocks in the rst
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 5, 2020 at 3:48 AM yangerkun <yangerkun@huawei.com> wrote:
>
> Since we support the listbadblocks command, introduce the detail in the
> doc.
>
> Signed-off-by: yangerkun <yangerkun@huawei.com>

Thank you for the documentation.  I have a few corrections listed below:

> ---
>  .../admin-guide/device-mapper/dm-dust.rst        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
> index b6e7e7ead831..185b3ce6298b 100644
> --- a/Documentation/admin-guide/device-mapper/dm-dust.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
> @@ -205,6 +205,21 @@ appear::
>
>          kernel: device-mapper: dust: clearbadblocks: no badblocks found
>
> +Listling the bad block list

"Listing the bad block list"

> +---------------------------
> +
> +To list all bad block list, run the following message command::

"To list all bad blocks in the bad block list"

> +
> +        $ sudo dmsetup message dust1 0 listbadblocks
> +
> +We will get following message(image that we have insert block 1/2, and
> +we will list the block index in order)::

"The following message will appear, listing one bad block number per
line (using an example device with blocks 1 and 2 in the bad block
list)"

After those corrections are made,

Reviewed-by: Bryan Gurney <bgurney@redhat.com>


Thanks,

Bryan



> +
> +        device-mapper: dust: dust_list_badblocks: badblocks list as below:
> +        device-mapper: dust: bad block: 1
> +        device-mapper: dust: bad block: 2
> +        device-mapper: dust: dust_list_badblocks: badblocks list end.
> +
>  Message commands list
>  ---------------------
>
> @@ -223,6 +238,7 @@ Single argument message commands::
>
>          countbadblocks
>          clearbadblocks
> +        listbadblocks
>          disable
>          enable
>          quiet
> --
> 2.25.4
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

