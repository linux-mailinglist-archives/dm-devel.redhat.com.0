Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BDCC8916
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 14:58:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE597300BEAC;
	Wed,  2 Oct 2019 12:58:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95BE461F42;
	Wed,  2 Oct 2019 12:58:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D53054EBC9;
	Wed,  2 Oct 2019 12:58:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x92CvSKT029631 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 08:57:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D70F100194E; Wed,  2 Oct 2019 12:57:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 184001001B13
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 12:57:25 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8BF2898105
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 12:57:22 +0000 (UTC)
X-Originating-IP: 209.85.166.44
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44]) (Authenticated sender: gmail@opensvc.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 07558C0002
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 12:57:20 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id z19so56719620ior.0
	for <dm-devel@redhat.com>; Wed, 02 Oct 2019 05:57:20 -0700 (PDT)
X-Gm-Message-State: APjAAAU18401s75Ch4QUt4iY6dCtMKmI8YOrlAaM+h39Y3RCBxhwUwav
	vamQUHREnKLzR5+ahHylK/IYe+uh1F1TqbU20cY=
X-Google-Smtp-Source: APXvYqwA3KGbBGbkEE+7RsGSNuNvz563bBCH1JU5mainR6OdA2usnM7mbWQU1aEb2NFN3azyIZ/ngaknv1huBl4GINM=
X-Received: by 2002:a92:244f:: with SMTP id k76mr3779428ilk.257.1570021039602; 
	Wed, 02 Oct 2019 05:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <d9c6c092-2ba8-8fb5-7b66-8b151cae51a4@gmail.com>
In-Reply-To: <d9c6c092-2ba8-8fb5-7b66-8b151cae51a4@gmail.com>
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 2 Oct 2019 14:57:07 +0200
X-Gmail-Original-Message-ID: <CABr-GncuPEPkauqmDVh-xOmSvBshuJHxUd5trY-_EN40DUtnMA@mail.gmail.com>
Message-ID: <CABr-GncuPEPkauqmDVh-xOmSvBshuJHxUd5trY-_EN40DUtnMA@mail.gmail.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.67]); Wed, 02 Oct 2019 12:57:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Wed, 02 Oct 2019 12:57:24 +0000 (UTC) for IP:'217.70.183.198'
	DOMAIN:'relay6-d.mail.gandi.net' HELO:'relay6-d.mail.gandi.net'
	FROM:'christophe.varoqui@opensvc.com' RCPT:''
X-RedHat-Spam-Score: -0.7  (HTML_MESSAGE, RCVD_IN_DNSWL_LOW, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 217.70.183.198 relay6-d.mail.gandi.net 217.70.183.198
	relay6-d.mail.gandi.net <christophe.varoqui@opensvc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Subject: Re: [dm-devel] [multipath-tools] merges
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
Content-Type: multipart/mixed; boundary="===============7871928410148306084=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 02 Oct 2019 12:58:23 +0000 (UTC)

--===============7871928410148306084==
Content-Type: multipart/alternative; boundary="0000000000005b050b0593ed0242"

--0000000000005b050b0593ed0242
Content-Type: text/plain; charset="UTF-8"

Done. Thank you.

On Wed, Oct 2, 2019 at 2:56 PM Xose Vazquez Perez <xose.vazquez@gmail.com>
wrote:

> Hi Christophe,
>
> 0.8.3 is not tagged:
> https://git.opensvc.com/?p=multipath-tools/.git;a=tags
>
>
> Thanks.
>

--0000000000005b050b0593ed0242
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Done. Thank you.<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 2, 2019 at 2:56 PM Xose Va=
zquez Perez &lt;<a href=3D"mailto:xose.vazquez@gmail.com">xose.vazquez@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi Christophe,<br>
<br>
0.8.3 is not tagged: <a href=3D"https://git.opensvc.com/?p=3Dmultipath-tool=
s/.git;a=3Dtags" rel=3D"noreferrer" target=3D"_blank">https://git.opensvc.c=
om/?p=3Dmultipath-tools/.git;a=3Dtags</a><br>
<br>
<br>
Thanks.<br>
</blockquote></div>

--0000000000005b050b0593ed0242--


--===============7871928410148306084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============7871928410148306084==--

