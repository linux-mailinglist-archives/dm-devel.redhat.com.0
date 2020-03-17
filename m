Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id AF3901889D4
	for <lists+dm-devel@lfdr.de>; Tue, 17 Mar 2020 17:10:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584461400;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Szhmkp/ml8e2PZ+EtP+bFbo1FjpKqYKVwRMW0U7dt0Y=;
	b=hwpXy0apSa2vnQ6XTLbt9SNuoe9omx6TaDYp3AmQNGhrL6tKPc0nVriEhApAUSJaC/GspG
	dZQyyCVUd/Bpsk+XccOGhz6o1m5a7uFrPygcW8oXlv/DvPm54NIdL0NT/j3+0mJE41FEOV
	1jXe44zGLwj3aYM7DUfrFbKb3pE7CNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-n4JiUBHTO5KTV2rX0PGenQ-1; Tue, 17 Mar 2020 12:09:57 -0400
X-MC-Unique: n4JiUBHTO5KTV2rX0PGenQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59967800D50;
	Tue, 17 Mar 2020 16:09:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABB5573881;
	Tue, 17 Mar 2020 16:09:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 233481809567;
	Tue, 17 Mar 2020 16:09:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HG9N33006960 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 12:09:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F4792166AE3; Tue, 17 Mar 2020 16:09:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A1232166AE2
	for <dm-devel@redhat.com>; Tue, 17 Mar 2020 16:09:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9E8F101A55E
	for <dm-devel@redhat.com>; Tue, 17 Mar 2020 16:09:19 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-4w5Ei88YMu-getSxzihAgw-1; Tue, 17 Mar 2020 12:09:17 -0400
X-MC-Unique: 4w5Ei88YMu-getSxzihAgw-1
Received: by mail-vs1-f65.google.com with SMTP id p7so12038389vso.6
	for <dm-devel@redhat.com>; Tue, 17 Mar 2020 09:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uNtjNlODl0M7KF64hEwX4/KoQh7Lxe4PMngTdrFc/F0=;
	b=j/xahkZL1LCYMh5UheyesMbloCGsZJ5ocJw3E46JyvfyPo+lQvVuZvp5UrupHVXeI0
	B8oZL6LjHnyIajn2m+1MSphPyxSAxQ8Tg0pizEQ5zaAop/qxSouiEu5tj98ccaDodvig
	ga3gDouvZINhKEOMpCeJTkm7ab8F0slFx2WaR0PSgjqOZJXJh858iQCWIoi8XA9/1e9M
	Cmm0VdYntej1hBFuN1NR6mjObddccPlOSX4+FCLu3fFBv6oviE9txDGDlaZXi7OZtoK4
	jk6R4iaLig2YV2ONj8KSHpztjzfWR+wGsAxDzbQY/dkdWlxydmqP4mKQF5gUU9knQU6Q
	7PxQ==
X-Gm-Message-State: ANhLgQ3fvK7K7J4MUwvVmwtt36HbNQaJ6Req48OBBoOKTcQWjcpYWiSi
	wn2xY/HIQ9EN9k6JPctDFlMpl6M10jAjhtVX0XqewQ==
X-Google-Smtp-Source: ADFU+vuta8dGMW0aK2OZQ0ZJyAUK5yuT5A8YaUJ7QFFpVJ1DHW1anWQUNJk49RzIcL4yefrjBcTXIdwhtAXrHxybK6U=
X-Received: by 2002:a67:6f84:: with SMTP id k126mr4459111vsc.112.1584461353535;
	Tue, 17 Mar 2020 09:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <5e70da92.1c69fb81.c30ac.5d5cSMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <5e70da92.1c69fb81.c30ac.5d5cSMTPIN_ADDED_BROKEN@mx.google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 17 Mar 2020 09:09:02 -0700
Message-ID: <CABCJKuf6X6fi8fqF_z0HYX0rnD8b98=L-8Y31=OiPEVzw0d1_Q@mail.gmail.com>
To: "Shetty, Harshini X (EXT-Sony Mobile)" <Harshini.X.Shetty@sony.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02HG9N33006960
X-loop: dm-devel@redhat.com
Cc: "snitzer@redhat.com" <snitzer@redhat.com>, "Takeuchi,
	Shingo \(SOMC\)" <Shingo.Takeuchi@sony.com>, "Nagaraju,
	Srinavasa \(SOMC\)" <Srinavasa.Nagaraju@sony.com>, "Khasnis,
	Soumya X \(EXT-Sony Mobile\)" <Soumya.Khasnis@sony.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, "Takahashi,
	Masaya \(SOMC\)" <Masaya.Takahashi@sony.com>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm verity fec: Fix memory leak in
	verity_fec_ctr
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

On Tue, Mar 17, 2020 at 7:11 AM Shetty, Harshini X (EXT-Sony Mobile)
<Harshini.X.Shetty@sony.com> wrote:
>
> Fix below kmemleak detected in verity_fec_ctr.
> output_pool is allocated for each dm-target device.
> But it is not freed when dm-table for the target
> is removed.Hence Free the output buffer in destructor
> function verity_fec_dtr

Good catch, thanks for the fix!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

