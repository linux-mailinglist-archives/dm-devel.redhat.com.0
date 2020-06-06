Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 918EF1F0853
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 21:24:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591471490;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+EQnLFRcoFnzFceWguPpsdvTzj0twUCJP1k7xjiOyuE=;
	b=RUeqfKfm56eyhGf3nP1is2YKwSlYctXHRPickOY79QKTKTa9WJ3BrwYxSoX4WZ99ESZxLF
	AMqJWA8XEdjHwJCy0A0fKjWTtkZt5G1aLPg1i3RY52L8KqgaTMRkAjONlrNm/ZCmKL6c2d
	3Z6MUVUZWipKzWd+VIdajotgjZAurHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-cOI0yC2JP5qvuOEbbHIMwA-1; Sat, 06 Jun 2020 15:24:48 -0400
X-MC-Unique: cOI0yC2JP5qvuOEbbHIMwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B09F61853578;
	Sat,  6 Jun 2020 19:24:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A1DF6E9F3;
	Sat,  6 Jun 2020 19:24:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C90114CE2;
	Sat,  6 Jun 2020 19:24:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 056JOA2w015378 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 6 Jun 2020 15:24:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 159A22166B27; Sat,  6 Jun 2020 19:24:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B5B22166B28
	for <dm-devel@redhat.com>; Sat,  6 Jun 2020 19:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09BFD811E7A
	for <dm-devel@redhat.com>; Sat,  6 Jun 2020 19:24:07 +0000 (UTC)
Received: from m4a0072g.houston.softwaregrp.com
	(m4a0072g.houston.softwaregrp.com [15.124.2.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-295-d3tRIuj-PfKDLaRgyF0TWA-1;
	Sat, 06 Jun 2020 15:24:02 -0400
X-MC-Unique: d3tRIuj-PfKDLaRgyF0TWA-1
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP; 
	Sat,  6 Jun 2020 19:22:44 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 6 Jun 2020 19:23:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 6 Jun 2020 19:23:31 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB2011.namprd18.prod.outlook.com (2603:10b6:4:62::34)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23;
	Sat, 6 Jun 2020 19:23:28 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.3066.023;
	Sat, 6 Jun 2020 19:23:28 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [RFC PATCH 0/2] multipath: change default devnode blacklist
Thread-Index: AQHWOtChNijDmeLieUmNdoPjJbkaBajKZxcAgAA0RwCAAV7nAA==
Date: Sat, 6 Jun 2020 19:23:28 +0000
Message-ID: <3442de794faf5c0d1efc7fd95e4fc0e968bbc5e1.camel@suse.com>
References: <1591317060-25484-1-git-send-email-bmarzins@redhat.com>
	<9db7560136de15dad358e2832f236ae131e145ef.camel@suse.com>
	<20200605222730.GB5894@octiron.msp.redhat.com>
In-Reply-To: <20200605222730.GB5894@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 697bf06d-e48a-434f-d9dd-08d80a4f1782
x-ms-traffictypediagnostic: DM5PR1801MB2011:
x-microsoft-antispam-prvs: <DM5PR1801MB20111CFB1FC2FF65EF373050FC870@DM5PR1801MB2011.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04267075BD
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GbwyyR/b49SU/KVbQ8O5Df6WdmwmBxKPlUBNqPeCxToEKe7KI+0AKBBR67nD06oH/FHNi8rHA33/WOzREf4GFTpaJ0ytZQzXa1tLHnhbhOtjcdOj7PrQH2Jg5NjVPIVYzT6V5PwL8vlEYLKVneIQQAPhK1SmFGKU7cfaK8kEuo/t5+vWr3Ybg5M9ZIHAS3J5TUFh2PNavDKqc868Zqa7OJKZXCOqocTC19Yi3ECMaWy88MmdyZVpttu6hqPxlRHLlgtqREl+nAt0uqZPVQgh16wSWmEmyhTXG2m2qruEvUbIK8Ji+z9mpqcAIJbSvdMQ9axerdDlIw3wegMxVaEUwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(6916009)(66574014)(8676002)(4326008)(2906002)(8936002)(6486002)(83380400001)(5660300002)(66476007)(66446008)(2616005)(64756008)(66556008)(36756003)(71200400001)(76116006)(91956017)(316002)(66946007)(478600001)(86362001)(54906003)(6512007)(26005)(186003)(6506007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: uugtV7nr+yByq9nVNNOEcYvSAvXhJTVdrTIjfvhXSUxtfzZyAf5b5Niuw+NhiSpoSXI5h5H0FUvAnsNu9ND/n19V3k1RFCY9nURSbBx91Qob4DsY/Nu23i6LMBhI8Gb/G5Lr3WAWlNiUEEMAtqesgen+TGrqvzXWYyr3ummKHxx0X7+cWUq9zGCQdspGc8MUBPFZCc/Ii0nIO5jMqZe+fMiW8JkeG3YsTRfSB0hr9vzpZgd+YduzxpaFBrrr8Iy++a8rDjFxbxX8NEPTYoxOcLlUxrZcfeb+RVekxu88aNCdIV/mtyKApfu5w4oIYNE22p5tNWRmlZcCIt4pHAFnwuAWu4cr+fGpK3AYp6gjy/PcecVUrzpnm72gs5asMbCbD9QgX0lNFah6CA2g/FTW5a7PPfGRuHZD7W2jAnoAOjue0kP+8P9/xmC7Vat9N8RwZaE/HYqsRR9Z6vLWvGi7BAA4XKaGhf0Gi+Xw3wOY3Gc=
x-ms-exchange-transport-forked: True
Content-ID: <258A5EA35B075349956CE678021D688C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 697bf06d-e48a-434f-d9dd-08d80a4f1782
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2020 19:23:28.2922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBukDziW1gOzHFSZBPSQz00Dbmz8qCWzp+s9++0YM2ayNVklbOyX/PWddFKdBpqgUCQ/4bGLfrGqgPh1yVMQBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB2011
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 056JOA2w015378
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"nkshirsa@redhat.com" <nkshirsa@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 0/2] multipath: change default devnode
	blacklist
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-06-05 at 17:27 -0500, Benjamin Marzinski wrote:
> On Fri, Jun 05, 2020 at 07:20:26PM +0000, Martin Wilck wrote:
> > Hi Ben,
> >=20
> > On Thu, 2020-06-04 at 19:30 -0500, Benjamin Marzinski wrote:
> > > I recently got a request to add the Oracle ASM filer driver
> > > devices
> > > to
> > > multipath's builtin devnode blacklist.  However, instead of
> > > having to
> > > do
> > > always this for each device type individually, I decided to make
> > > multipath blacklist all non scsi, nvme, and dasd devnodes by
> > > default.
> > > This is what the multipath udev rules already do. If people don't
> > > like
> > > this solution, the alternative is to add another line to the
> > > default
> > > devnode blacklist like "^(asm/|oracleafd/|ofsctl)".
> >=20
> > Thanks, this looks ok. But I'd like to propose an alternative idea:
> > Extend the RE syntax in our config file to allow negated regular=20
> > expressions. Like this:
> >=20
> > blacklist {
> >     devnode "!(^(sd[a-z]|dasd[a-z]|nvme[0-9]))"
> > }
> >=20
> > The "!(${RE})" construct would mean "everything that does not match
> > ${RE}".
> > This logic would only be applied to an entire regex.
> > If a user needs a RE matching with "!(" and ending with ")", she
> > can escape=20
> > the exclamation mark "\!(like this)".
> >=20
> > AFAICS this could be implemented quite easily (by adding a "bool
> > negate" field
> > in struct blentry and some simple parser logic), and could be
> > applied to other=20
> > REs in the config file as well. We could print this with "multipath
> > -t", and=20
> > we wouldn't need to document an exception.
> >=20
> > It's also pretty much backwards-compatible, I don't think many
> > people use
> > regexes starting with "!(" for multipath these days.
>=20
> Sure, but since we can only really support negating the whole regular
> expression, and c regular expressions don't treat '!' as a special
> character, why do we need the prentheses around the regular
> expression?
> It seems like we can just treat regular expressions starting with '!'
> as
> negated, and ones starting with "\!" as starting with a literal '!'.
>=20
> Do you think that there is much chance that users have blacklist
> strings
> that start with '!'? There are no devnodes, udev properties, or
> protocols that start with that.  I don't know of a UUID format that
> has
> an exclamation point, and while it's possible that a product string
> starts with one, it seems really unlikely.
>=20

Sure, just using "!" would be fine, too, and simpler. Does this mean
you agree with my proposal in general?

Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

