Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C1A6E04
	for <lists+dm-devel@lfdr.de>; Tue,  3 Sep 2019 18:24:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D7FE3001571;
	Tue,  3 Sep 2019 16:24:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F31AC60C18;
	Tue,  3 Sep 2019 16:24:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FEA824F2F;
	Tue,  3 Sep 2019 16:24:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83GNCht016912 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 12:23:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 516995DD63; Tue,  3 Sep 2019 16:23:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0DB15DA8C;
	Tue,  3 Sep 2019 16:23:09 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A5283084029;
	Tue,  3 Sep 2019 16:23:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j16so18167961wrr.8;
	Tue, 03 Sep 2019 09:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TepBcnay70WrGmb0WBkOD/Cs9CShXo+TxS9/OGqh6Bw=;
	b=EKHkp/aqR3DigOCLFd9MIjlOwoKCQetnK8fr3HngH/gmy44B/y+LUfRJnQJYWb6Cvo
	8mEv5H9vPsNOdeBU6+QazVE8YKbL4Ks0DybjlhHXBqNmcH8loNv9Yp47V1EmvhvpineH
	M0H4k3nAyfQh480J1dBLjqfa+BSK1wWphJaM2ef0qpf7OjVmdoHnF9SQt+HNNmNQ2at/
	Y9yU3fbQC4I2CC9fwIX1huaI5p9BHj9JMlCN+EKbXwcPw3B/YI8zycMEkVzAScoOuEf1
	juB1OBjcPWcL3N+j+VnKYHpHRr34IiVZ//Oo17/9CkRglejFCo2L6hRYuW4uNwWs2/er
	nO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TepBcnay70WrGmb0WBkOD/Cs9CShXo+TxS9/OGqh6Bw=;
	b=XM0pfCwH5wIGtzrAWoq8HrX7uLYr47paMU7BqnifDDoYAADWtsvCx93o+teo/MLs38
	tPzd0g2YTxjWrX7eqbhV6/H1nMOhV1mJbfmVZW2qOy+Xwo4bpTy0+YTXEUIAIA41PXwr
	QdfE7BetQgt+moZ7w74mbjwWvKJ2gELTMAoAYrOjcQeS0NddNGzKBayMnI9Q7TVrr+gq
	WVVgsHbUMUvJ9dg9B4WFu1qKUPo5nEwCaA+cK/tO3UF8Qq4AlyPWS27YtU2V6baWR6q7
	fgQF4+twCHqVpoqJ6GM10ZkYutHfMC/T4DtFkyOPD+3fsZNwHv88aV/MSHwECzlW+7ay
	hsnA==
X-Gm-Message-State: APjAAAVzb2U95SNHqN4gr5Mvi7rHsuAGm73sHoI0S9sL3zj5tFFJj2iN
	qrQvuNqOvTy8QIMSjhwvDg==
X-Google-Smtp-Source: APXvYqwx0bJ6xnL9cz14xzE50FT6ThicgK4OWReQhuR8YKvDLg+VcrlLQG0HKsV1CSwULWCwxVvs1A==
X-Received: by 2002:adf:f20f:: with SMTP id p15mr8540655wro.17.1567527788037; 
	Tue, 03 Sep 2019 09:23:08 -0700 (PDT)
Received: from avx2 ([46.53.254.228])
	by smtp.gmail.com with ESMTPSA id c74sm11892wme.46.2019.09.03.09.23.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Sep 2019 09:23:07 -0700 (PDT)
Date: Tue, 3 Sep 2019 19:23:03 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <20190903162303.GA2173@avx2>
References: <20190902210558.GA23013@avx2>
	<7b94004e-4a65-462b-cd6b-5cbd23d607bf@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b94004e-4a65-462b-cd6b-5cbd23d607bf@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 03 Sep 2019 16:23:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 03 Sep 2019 16:23:09 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'adobriyan@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <adobriyan@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, peterz@infradead.org,
	aarcange@redhat.com, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, dm-devel@redhat.com, mingo@redhat.com
Subject: Re: [dm-devel] [PATCH] sched: make struct task_struct::state 32-bit
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 03 Sep 2019 16:24:16 +0000 (UTC)

On Tue, Sep 03, 2019 at 12:02:38AM +0100, Valentin Schneider wrote:
> struct task_struct {
> 	struct thread_info         thread_info;          /*     0    24 */
> 	volatile int               state;                /*    24     4 */
> 
> 	/* XXX 4 bytes hole, try to pack */
> 
> 	void *                     stack;                /*    32     8 */
> 
> Though seeing as this is also the boundary of the randomized layout we can't
> really do much better without changing the boundary itself. So much for
> cacheline use :/

Cacheline use of task_struct is pretty hopeless because of all the ifdefs.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
