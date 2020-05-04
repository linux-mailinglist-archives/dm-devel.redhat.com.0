Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE2B1C46A3
	for <lists+dm-devel@lfdr.de>; Mon,  4 May 2020 21:04:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588619048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ymq0m0b6tnm7R4diqVDNY6DCwFeTnKG+5JzZo1C9kqo=;
	b=N/I8DU3NyUe3KTRiRmgSCPgn1RfVFLgvUxPOK1u/gBbYgd9lLRyHOTPL7nuxdBApTT6ZvI
	IQD7N0r+NmV8VppUY3ali+g+cyCaQIl8p2ynePzZnbbzTpTEh9A2SKR+Hqfvxrb8yinZC9
	XTm0xNsi913HzH0O28uz7uH42lS13NU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-7qpncJRIOaeyZz07IvFHAQ-1; Mon, 04 May 2020 15:04:02 -0400
X-MC-Unique: 7qpncJRIOaeyZz07IvFHAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3646800687;
	Mon,  4 May 2020 19:03:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A461B60C87;
	Mon,  4 May 2020 19:03:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA96D4CAA8;
	Mon,  4 May 2020 19:03:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 044J3gBM026761 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 May 2020 15:03:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 974042157F23; Mon,  4 May 2020 19:03:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92DAC2166B27
	for <dm-devel@redhat.com>; Mon,  4 May 2020 19:03:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8807882642
	for <dm-devel@redhat.com>; Mon,  4 May 2020 19:03:39 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24-WVaZqjoMOp2NvRVBEPxOFQ-1; Mon, 04 May 2020 15:03:36 -0400
X-MC-Unique: WVaZqjoMOp2NvRVBEPxOFQ-1
Received: by mail-il1-f181.google.com with SMTP id q10so12358439ile.0
	for <dm-devel@redhat.com>; Mon, 04 May 2020 12:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=3ikIDOHbnkvY4ri20q2bFV0lSX3GlYiLNWNIPLau4e4=;
	b=XeuZj/vPOh7XtO7yubu6NIrgSK5Nge/dkVbp5wJTiOAPzos19UeQLU4G1AdND11uN9
	5bEhHGEv3zBC81hIwL/lGzeTSwPKnkaCOFAix/+xohnezluM8inHZvvprfbHoR6bSHj3
	W83mQMzRPq0YB5V4sTzwX0/KGrTwwgtR+AUXPPT8OqTNgzgrL1dqLZSRGx2YItHL9ode
	N11Al1f1oWVIXvxFx3VHOIw0nq9cjuzjbdvGfhEQen1NZRCq1MIjjC6q3deuHCg/OslQ
	mzO8eDDGBbljRzKl2sETOoE+Qr3XHyfrpDxQ/i2HQjPNwujFbi5r1lciSH2CH2HEt1B+
	/XGQ==
X-Gm-Message-State: AGi0PubDTA2O79Vr1QhhD1fkRVYlwVUPE26Fh14SuIN83SRPWhNO1Jw1
	6WaA//OFwesDV+a2q/nOr/j4sKIeRXO771E3NJrGgBpC
X-Google-Smtp-Source: APiQypJWrMDhY7A4/q7VL/C9uOFSGRJHt/oR9bKX3X0+YPR/hYzpDJBmVl57jFeePgnZgQqCQR+NndVuLnh8jvKEQ1I=
X-Received: by 2002:a92:750b:: with SMTP id q11mr18058822ilc.50.1588619015661; 
	Mon, 04 May 2020 12:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAN-y+ELN7GW5hiOQcK7nTe-_A9XdJExQUEuy7MmiJhzsZTf0+A@mail.gmail.com>
In-Reply-To: <CAN-y+ELN7GW5hiOQcK7nTe-_A9XdJExQUEuy7MmiJhzsZTf0+A@mail.gmail.com>
From: Drew Hastings <dhastings@crucialwebhost.com>
Date: Mon, 4 May 2020 12:03:25 -0700
Message-ID: <CAN-y+E+XKJ6YnXSQaOFOogaueUv3SX2VVTnbc9hvHVRdvtKFHw@mail.gmail.com>
To: dm-devel@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] Thin provisioning bug in dm-thin
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0060326884369960306=="

--===============0060326884369960306==
Content-Type: multipart/alternative; boundary="0000000000001ccef105a4d7307a"

--0000000000001ccef105a4d7307a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

My mistake - I had been looking at an old version (and had a typo in my
original message). I can see it's correct in the latest version. You can
disregard this.

On Mon, May 4, 2020 at 11:54 AM Drew Hastings <dhastings@crucialwebhost.com=
>
wrote:

> In process_create_snap_mesg, when dm_thinner_pool_create_snap fails, the
> DMWARN is for ARGV[1] and ARGV[2], but should be for 0 and 1.
>

--0000000000001ccef105a4d7307a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My mistake - I had been looking at an old version (and had=
 a typo in my original message). I can see it&#39;s correct in the latest v=
ersion. You can disregard this.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, May 4, 2020 at 11:54 AM Drew Hasting=
s &lt;<a href=3D"mailto:dhastings@crucialwebhost.com">dhastings@crucialwebh=
ost.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr">In=C2=A0process_create_snap_mesg, when dm_thinner_p=
ool_create_snap fails, the DMWARN is for ARGV[1] and ARGV[2], but should be=
 for 0 and 1.<br></div>
</blockquote></div>

--0000000000001ccef105a4d7307a--

--===============0060326884369960306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0060326884369960306==--

