Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 32706A9BCC
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 09:30:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66F212A09B0;
	Thu,  5 Sep 2019 07:30:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35B0B60610;
	Thu,  5 Sep 2019 07:30:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC9FE24F32;
	Thu,  5 Sep 2019 07:30:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x856hk0D020931 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 02:43:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C3F06012D; Thu,  5 Sep 2019 06:43:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47942600F8;
	Thu,  5 Sep 2019 06:43:41 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10BACC08E282;
	Thu,  5 Sep 2019 06:43:40 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id k12so390007uan.13;
	Wed, 04 Sep 2019 23:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=mBNoSRoZyw6gyV0ALwG5Kbr6dbwi5LhUqvWvoVZfLQY=;
	b=CDHjgwsYwrHaTTre0g4KWSR+uD9XYRMBrA89aWenwLajolInk5CbSbUL2Mav/nCv+i
	y3LHWmpy/b87DmSV5q3SflWnM2m34sWJ8bBO+sTmjsjnpaYmJ0rDKN0bpn+TLiUYojhd
	ULPdoPi4hHEnxNTbAlPxQEg2TjL3nhd3bZOVDqxV/CwhMylAFStoJuuKUb8FkLR6qCPI
	7ylv0T//eNrPmejIDQnbp/M8D50eeUwSFON9PJWIdDFOxTiUVSOT3jbeEuefQIJ/9JPl
	ZRw87O2jOJKyAVs7ppbmuUcKpLRao+rbahJTxUNi5UwkBY0VnUOawfp+YEGpZTIHDEwG
	RUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=mBNoSRoZyw6gyV0ALwG5Kbr6dbwi5LhUqvWvoVZfLQY=;
	b=Z1fpXH/aqblXUFL+/Q4uG048Jfzd6DjH2tZhpmF9pTUu9X9XPH4/kmUt+KrKk71I1R
	7Aykz/fxBzVei5+al3j1PfOTlm9GvLusctaB0ud26zdPVGA2Dy2HZfXV8FZTCVNUCMNo
	1mIfR7MxygXYn97NO8pXDHfi4H69zeIY6KQzL1EPOoS6i+qfu06TDF0lG4Zk0Bn0Xunk
	at+eRphzXe1b0VXUUIeSJWV5woSYu8BZOp1rtmrwYUGwNiyIR8zhveF30Ct7H8JLsCOa
	fgdPcSRKOfF5VjmrM+XO1RN3ltuI4WABakRo5s7/wrM+sfLRocUwUfnO3t6kPaB5VuoZ
	2Cag==
X-Gm-Message-State: APjAAAX8uVhx8pDsm8zRLpIUBNnMOBj6eXw4rp9CNfdLyG3ShsYF++WG
	FkmfJydV73mBWzZ3tgTHcjDTX43J2QC2pSCcYjtjR3xz
X-Google-Smtp-Source: APXvYqyt6r6hphG9VHnbCb1sNHF/NSRXoxdcJUAqF1g1ipRRzeGVYr7dQzH9IKIi/y8z0k7EY985m7yI2H9QRc6cGvM=
X-Received: by 2002:ab0:210f:: with SMTP id d15mr575468ual.129.1567665819169; 
	Wed, 04 Sep 2019 23:43:39 -0700 (PDT)
MIME-Version: 1.0
From: jianchao wang <jianchao.wan9@gmail.com>
Date: Thu, 5 Sep 2019 14:43:28 +0800
Message-ID: <CAC-DDmMQu38J6kCirxK=axwEguEpaN+H1JJVPbUsyqtxcx5KEw@mail.gmail.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 05 Sep 2019 06:43:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 05 Sep 2019 06:43:40 +0000 (UTC) for IP:'209.85.222.45'
	DOMAIN:'mail-ua1-f45.google.com' HELO:'mail-ua1-f45.google.com'
	FROM:'jianchao.wan9@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.152  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.45 mail-ua1-f45.google.com 209.85.222.45
	mail-ua1-f45.google.com <jianchao.wan9@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 05 Sep 2019 03:30:15 -0400
Subject: [dm-devel] Why does dm-thin pool metadata space map use 4K page to
	carry index ?
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
Content-Type: multipart/mixed; boundary="===============4593842141826827868=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 05 Sep 2019 07:30:36 +0000 (UTC)

--===============4593842141826827868==
Content-Type: multipart/alternative; boundary="0000000000004736ac0591c8a4c0"

--0000000000004736ac0591c8a4c0
Content-Type: text/plain; charset="UTF-8"

Hi

As the code,

The metadata space map use following structure which locates on a 4K page
on disk
to carry the disk_index_entry.

The on-disk format of metadata spacemap

The metadata space's bitmap root is a
#define MAX_METADATA_BITMAPS 255
struct disk_metadata_index {
    __le32 csum;
    __le32 padding;
    __le64 blocknr;

    struct disk_index_entry index[MAX_METADATA_BITMAPS];
} __packed;

It will be read in when open the pool
sm_ll_open_metadata
  -> set ll callbacks
  -> ll->open_index
metadata_ll_open
---
    r = dm_tm_read_lock(ll->tm, ll->bitmap_root,
                &index_validator, &block);
    if (r)
        return r;

    memcpy(&ll->mi_le, dm_block_data(block), sizeof(ll->mi_le));
    dm_tm_unlock(ll->tm, block);

---
The size of struct disk_metadata_index is 4096.
The disk_index_entry's size is 8 bytes

4096 * 8 / 2 = 16K    blocks per page

metadata block = 4K

256 * 16K * 4K = 16G

Then it have a 6G limit on metadata blocks size.

But why does it use this 4K page instead of btree as the disk sm ?

The brb mechanism seem be able to avoid the nested block allocation
when do COW on the metadata sm btree.

Would anyone please help to tell why does it use this 4K page instead of a
btree ?


Thanks in advance
Jianchao

--0000000000004736ac0591c8a4c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><br>As the code,<br><br>The metadata space map use f=
ollowing structure which locates on a 4K page on disk<br>to carry the disk_=
index_entry.<br><br>The on-disk format of metadata spacemap<br><br>The meta=
data space&#39;s bitmap root is a<br>#define MAX_METADATA_BITMAPS 255<br>st=
ruct disk_metadata_index {<br>=C2=A0 =C2=A0 __le32 csum;<br>=C2=A0 =C2=A0 _=
_le32 padding;<br>=C2=A0 =C2=A0 __le64 blocknr;<br><br>=C2=A0 =C2=A0 struct=
 disk_index_entry index[MAX_METADATA_BITMAPS];<br>} __packed;<br><br>It wil=
l be read in when open the pool<br>sm_ll_open_metadata<br>=C2=A0 -&gt; set =
ll callbacks<br>=C2=A0 -&gt; ll-&gt;open_index<br>metadata_ll_open<br>---<b=
r>=C2=A0 =C2=A0 r =3D dm_tm_read_lock(ll-&gt;tm, ll-&gt;bitmap_root,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;index_validator, =
&amp;block);<br>=C2=A0 =C2=A0 if (r)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
r;<br><br>=C2=A0 =C2=A0 memcpy(&amp;ll-&gt;mi_le, dm_block_data(block), siz=
eof(ll-&gt;mi_le));<br>=C2=A0 =C2=A0 dm_tm_unlock(ll-&gt;tm, block);<br><br=
>---<br>The size of struct disk_metadata_index is 4096.<br>The disk_index_e=
ntry&#39;s size is 8 bytes<br><br>4096 * 8 / 2 =3D 16K =C2=A0 =C2=A0blocks =
per page<br><br>metadata block =3D 4K<br><br>256 * 16K * 4K =3D 16G<br><br>=
Then it have a 6G limit on metadata blocks size.<br><br>But why does it use=
 this 4K page instead of btree as the disk sm ?<br><br>The brb mechanism se=
em be able to avoid the nested block allocation<br>when do COW on the metad=
ata sm btree.<br><br>Would anyone please help to tell why does it use this =
4K page instead of a btree ?<br><br>=C2=A0<br>Thanks in advance<br>Jianchao=
<br><br><br></div>

--0000000000004736ac0591c8a4c0--


--===============4593842141826827868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============4593842141826827868==--

