Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 284CBAA60B
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 16:39:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DF2930044CE;
	Thu,  5 Sep 2019 14:39:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EEC760BE1;
	Thu,  5 Sep 2019 14:39:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 488631802218;
	Thu,  5 Sep 2019 14:39:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x85DqaWI005187 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 09:52:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10C0C60CD0; Thu,  5 Sep 2019 13:52:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAAD060BE1;
	Thu,  5 Sep 2019 13:52:28 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
	[209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09ECB2A09B8;
	Thu,  5 Sep 2019 13:52:28 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id b25so495445vkk.3;
	Thu, 05 Sep 2019 06:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=+1FYVHK93VazrsTUTh/LjFSklNOBmZpOlleFu0hl6fo=;
	b=epCBFNx6ezVxdxYFQaaptpO1rn8B0T9ePKBN8aLisBY+AERvWXhBrlZ1IVQdLf48LC
	l+kUrDZVg7czwiiDbtWNolZjCwXhjQ7GHB/0JOH76all4l8CDxwWLSfQpgItBW2yvz4U
	f9lmzickSo5WAG7ZiCnEejDXwviHR1q9Sa+qAhAPIwzcNLs203rGtc6kq9k5K6pEu3nh
	3l7+Xuc8n4aQUnoBJmyEfgeBSHn73EXq+aoTfZnb+eV2p5qymftGqB8V8zMsGS1S1h1I
	IDx6M05BsCVFF6MfNPCb9Ehbwao5x2PSK9nRYshV7Qe2LmPQcTo4hhcdQEkzvG5D4u7r
	7HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=+1FYVHK93VazrsTUTh/LjFSklNOBmZpOlleFu0hl6fo=;
	b=aS9KqwDVn4brsc+sQHv6oL9fh2boO8pEkLvjaHXlYR5Z14TWKbYWIXvUWvSP+4wuOO
	0q9GfIP8WQCSF1ApfMJrPo3XQoyWksqhBkG9rMPxTVM3DNe54Lg6RyH5VFKGgOlxQaDm
	UNvaXM3d4XAYrG+cg4c1K1+GhhSzuInr6/yCTV9w47ypQByO7AAcQCWFf9ezUqU/veLY
	U075/e72HqSMMnbEyws6Wfa3f8EeBpwWnE2oiuP8Vw2hmiMY+ua0wAwoo76LcgF7C9at
	HHpI1YRWro9eWbbn4OR2loxHsFt+zIJgwn1P3TqgNqspb1QlyV8UHYbiLoUH5jn/wvm0
	oRJA==
X-Gm-Message-State: APjAAAVEaYCwQBcCpM0x1K5p7bXBjhpfQzmbCRZxX90ym/az6MXKc94m
	bwxKVj5bf2AvhKIrto7qcEQ1RB9rJLrpz1qinXkURA==
X-Google-Smtp-Source: APXvYqzQ+ZgZ0gMacwnfmdzqh5VqADhbndlo7Cp8RzdKJp+1oFc6cfDC5ibAi7CViwJJqXwGItrhbcxwepRF9bQhZlE=
X-Received: by 2002:a1f:a24b:: with SMTP id l72mr1543790vke.21.1567691547271; 
	Thu, 05 Sep 2019 06:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-DDmMQu38J6kCirxK=axwEguEpaN+H1JJVPbUsyqtxcx5KEw@mail.gmail.com>
	<20190905103843.xnakopha6s6oeuyd@reti>
In-Reply-To: <20190905103843.xnakopha6s6oeuyd@reti>
From: jianchao wang <jianchao.wan9@gmail.com>
Date: Thu, 5 Sep 2019 21:52:15 +0800
Message-ID: <CAC-DDmNpa4w1LuC4gnpWJy-uuYv1vQshW_4XxVpKvD=LG=UCSg@mail.gmail.com>
To: jianchao wang <jianchao.wan9@gmail.com>, agk@redhat.com,
	snitzer@redhat.com, dm-devel@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 05 Sep 2019 13:52:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 05 Sep 2019 13:52:28 +0000 (UTC) for IP:'209.85.221.181'
	DOMAIN:'mail-vk1-f181.google.com'
	HELO:'mail-vk1-f181.google.com' FROM:'jianchao.wan9@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.151  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.181 mail-vk1-f181.google.com 209.85.221.181
	mail-vk1-f181.google.com <jianchao.wan9@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 05 Sep 2019 10:39:14 -0400
Subject: Re: [dm-devel] Why does dm-thin pool metadata space map use 4K page
 to carry index ?
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
Content-Type: multipart/mixed; boundary="===============2791592434910126023=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 05 Sep 2019 14:39:56 +0000 (UTC)

--===============2791592434910126023==
Content-Type: multipart/alternative; boundary="000000000000cae9300591cea1d1"

--000000000000cae9300591cea1d1
Content-Type: text/plain; charset="UTF-8"

Hi Joe

Thanks for your kindly response

On Thu, Sep 5, 2019 at 6:38 PM Joe Thornber <thornber@redhat.com> wrote:

> On Thu, Sep 05, 2019 at 02:43:28PM +0800, jianchao wang wrote:
> > But why does it use this 4K page instead of btree as the disk sm ?
> >
> > The brb mechanism seem be able to avoid the nested block allocation
> > when do COW on the metadata sm btree.
> >
> > Would anyone please help to tell why does it use this 4K page instead of
> a
> > btree ?
>
> It's a long time since I wrote this, so I can't remember the order that
> things
> were written.  It may well be that brb mechanism for avoiding recursive
> allocations
> came after the on disk formats were defined.  Irrespective of that the
> single page
> pointing to index pages should perform better.
>
> Is the 16G limit to the metadata device causing you issues?
>

Yes, we are planing to build a 200T pool at least and there are both normal
thin device
and snapshot running on it.  Smaller block size would be better, but 16G is
not enough.

Actually, I have modified the metadata sm code to use btree as the disk sm.
In my test
environment, I have used ~20G metadata.

Thanks
Jianchao

--000000000000cae9300591cea1d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Joe</div><div dir=3D"ltr"><br></div><d=
iv>Thanks for your kindly response</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 5, 2019 at 6:38 PM Joe Thornb=
er &lt;<a href=3D"mailto:thornber@redhat.com">thornber@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Se=
p 05, 2019 at 02:43:28PM +0800, jianchao wang wrote:<br>
&gt; But why does it use this 4K page instead of btree as the disk sm ?<br>
&gt; <br>
&gt; The brb mechanism seem be able to avoid the nested block allocation<br=
>
&gt; when do COW on the metadata sm btree.<br>
&gt; <br>
&gt; Would anyone please help to tell why does it use this 4K page instead =
of a<br>
&gt; btree ?<br>
<br>
It&#39;s a long time since I wrote this, so I can&#39;t remember the order =
that things<br>
were written.=C2=A0 It may well be that brb mechanism for avoiding recursiv=
e allocations<br>
came after the on disk formats were defined.=C2=A0 Irrespective of that the=
 single page<br>
pointing to index pages should perform better.<br>
<br>
Is the 16G limit to the metadata device causing you issues?<br></blockquote=
><div><br></div><div>Yes, we are planing to build a 200T pool at least and =
there are both normal thin device</div><div>and snapshot running on it.=C2=
=A0 Smaller block size would be better, but 16G is not enough.</div><div><b=
r></div><div>Actually, I have modified the metadata sm code to use btree as=
 the disk sm. In my test</div><div>environment, I have used ~20G metadata.<=
/div><div>=C2=A0</div><div>Thanks</div><div>Jianchao</div></div></div>

--000000000000cae9300591cea1d1--


--===============2791592434910126023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2791592434910126023==--

