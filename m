Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 651E11B877A
	for <lists+dm-devel@lfdr.de>; Sat, 25 Apr 2020 17:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587829593;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iLwKBC9ZtwGsJbS+2MgnK1jMYa7/snM/mDUPRTt72ns=;
	b=C2DhZeDOTxMVzJkyqXxpQ8gCgOhAcq30bQyxZt/SHv+HgjaYHmrMmi6bw/Cdd1sOJ51kO1
	y2bK3xjzHgkXUGhHBu75batvyopA53cf+2H2Y874Xm+LMrzGb/afM6i/FwM6NM3OWOMmiD
	209Hlj0bR1wU8mfTcgVbQkXCKmy9w0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-V7KP1ZOiODyeYWBnXczB9w-1; Sat, 25 Apr 2020 11:46:30 -0400
X-MC-Unique: V7KP1ZOiODyeYWBnXczB9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9031680B70B;
	Sat, 25 Apr 2020 15:46:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 343015C1C3;
	Sat, 25 Apr 2020 15:46:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A7F94CAA0;
	Sat, 25 Apr 2020 15:46:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03PFjhD2009343 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 25 Apr 2020 11:45:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1BC3B20316CF; Sat, 25 Apr 2020 15:45:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17D802026D5D
	for <dm-devel@redhat.com>; Sat, 25 Apr 2020 15:45:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA125811E77
	for <dm-devel@redhat.com>; Sat, 25 Apr 2020 15:45:39 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-165-nK4yCPyIOPCT-EiqOiu4NQ-1; Sat, 25 Apr 2020 11:45:37 -0400
X-MC-Unique: nK4yCPyIOPCT-EiqOiu4NQ-1
Received: by mail-pj1-f54.google.com with SMTP id a31so3280686pje.1
	for <dm-devel@redhat.com>; Sat, 25 Apr 2020 08:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WbXqUvy6Zx4jWra7/mKAUkU8JyHGv+EMw9mv1e/ZXrw=;
	b=f6DOM+xXO0hdeZq03Kpx73MfAor89FKy7T+S/FFhN3evcZ41pAAKmEX/ETAuWgKT8+
	dRJGMc76AtqvzlS5jLA/+TsHbYvQNuCT+d5tH7wrxBUmyvvlepWvUXH69ZodmKW2doXD
	AZsH/W6DHi8KeGQ+YGbeGkS5iUdBhsx1P26kz0rUr3apeRDnuqQ+mi9tuy7P1ZzQSTNq
	gKgpyxkST9KhJ5qZ5U5ah2pYsLuTkW8oTlHtcC/5wrZy3NzpCtXQ472gTWPMarOe/l4V
	zbLeM6FiMJfXhaf98O2nHeH1lQ23BNfyJHIB20BnRRcHF95gYdX+1GPY/1av8cwtHfh0
	7xlA==
X-Gm-Message-State: AGi0PubLxhxXQPj9yKkIxOYa+uKSPFK15nFQx+mdDqcPdnEr5+eKxNdy
	CHWzOTHziAteadmP4F1aQckR7A==
X-Google-Smtp-Source: APiQypIlBZtsrMImuPudY2tg2Rzjk77JhIq2anQwrD+xO4v3/vehSA9N2sPj2aHncEr8sTNiiKhqHQ==
X-Received: by 2002:a17:902:59cc:: with SMTP id
	d12mr7704421plj.237.1587829535828; 
	Sat, 25 Apr 2020 08:45:35 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.145])
	by smtp.gmail.com with ESMTPSA id
	f21sm8454701pfn.71.2020.04.25.08.45.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 25 Apr 2020 08:45:35 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200425075336.721021-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <98cd7aac-e4ee-8de0-e7aa-0d3e1a2b20e0@kernel.dk>
Date: Sat, 25 Apr 2020 09:45:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425075336.721021-1-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-bcache@vger.kernel.org
Subject: Re: [dm-devel] avoid the ->make_request_fn indirect for blk-mq
	drivers
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

On 4/25/20 1:53 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this small series avoids an indirect call for every submitted bio that
> eventually ends up being handled by blk-mq drivers.  Let me know what
> you think.

I like it, I've been pondering something like this for a bit, but
I like the simplicity of this one and changing it so that only
non-regular make_request_fn is set.

I'll apply this.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

